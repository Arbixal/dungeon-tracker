-- *********************************************************
-- **                  Dungeon Tracker                    **
-- **     https://github.com/arbixal/dungeon-tracker      **
-- *********************************************************
--
-- This addon is written and copyrighted by:
--    * Arbixal (Bixsham @ US-Remulos)
--
-- The code of this addon is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 3.0 License. (see license.txt)
-- All included textures and sounds are copyrighted by their respective owners, license information for these media files can be found in the modules that make use of them.
--
--
--  You are free:
--    * to Share - to copy, distribute, display, and perform the work
--    * to Remix - to make derivative works
--  Under the following conditions:
--    * Attribution. You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work). (A link to http://www.deadlybossmods.com is sufficient)
--    * Noncommercial. You may not use this work for commercial purposes.
--    * Share Alike. If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.
--

-- TODO: Add display profiles (Leveling, Gold Farming, Cloth Farming, Mining, etc)
-- TODO: Track reset timers
-- TODO: Be able to delete log entries
-- TODO: Detailed view of instance run (loot, boss kills, etc.)
-- TODO: Test solo run with boss kills
-- TODO: Test party run
-- TODO: Test raid run
-- TODO: Add combat logging
-- TODO: Do something more meaningful with data broker (reset timers, combat log on, current instance, etc)
-- TODO: Add configuration options (enable combat logging, vendor trash threshold)
-- TODO: Trim data footprint (archive old runs to just summary?)

-- Globals
local ADDON_NAME, ADDON_TABLE = ...
DT_ADDON_TITLE = GetAddOnMetadata(ADDON_NAME, "Title")
DT_ADDON_VERSION = GetAddOnMetadata(ADDON_NAME, "Version")

local DT = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0","AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)

-- Libraries
local LibDataBroker = LibStub("LibDataBroker-1.1")
local AceGUI = LibStub("AceGUI-3.0")

-- Locals
local _, _, _, uiVersion = GetBuildInfo()

local enabled_text = GREEN_FONT_COLOR_CODE..VIDEO_OPTIONS_ENABLED..FONT_COLOR_CODE_CLOSE
local disabled_text = RED_FONT_COLOR_CODE..VIDEO_OPTIONS_DISABLED..FONT_COLOR_CODE_CLOSE
local enabled_icon  = "Interface\\AddOns\\"..ADDON_NAME.."\\enabled"
local disabled_icon = "Interface\\AddOns\\"..ADDON_NAME.."\\disabled"

local DTInstanceInfo = _G.DTInstanceInfo
local DTLevelInfo = _G.DTLevelInfo
local db
local dbGlobal
local defaults = {
	profile = {
		combatLog = {},
        prompt = true,
        debugMode = true,
        debugLevel = 1,
        chatFrame = "DEFAULT_CHAT_FRAME",
		minimap = {
			hide = false,
			minimapPos = 250,
			radius = 80,
        },
        vendorTrashLevel = 0,
        filterOptions = {
            onlyShowCurrentCharacter = false,
            instanceFilter = nil
        },
    },
    global = {
        dungeonLog = {},
        resetTimers = {}
    }
}

function DungeonConsole:Debug(message)
    DT:Debug(message)
end

function DT:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("DungeonTrackerDB", defaults, "Default")
    db = self.db.profile
    dbGlobal = self.db.global
    
    if not db.version or db.version < 1 then
		db.combatLog = {}
		db.version = 1
    end

    if not dbGlobal.version then
        self:Debug("DB doesn't exist, creating new")
        dbGlobal.dungeonLog = {}
        dbGlobal.version = 1
    elseif dbGlobal.version < 2 then
        self:Debug("Migrating db from version 1 to version 2")
        dbGlobal.dungeonLog = _G.DT_MigrateV1_To_V2(db, dbGlobal)
        dbGlobal.version = 2
    else
        self:Debug("DB is correct version")
    end
    
    -- Create Dialogs

    -- LibDataBroker setup
    if LibDataBroker then
		DungeonTrackerDS = LibDataBroker:NewDataObject(ADDON_NAME, {
			--icon = LoggingCombat() and enabled_icon or disabled_icon,
			text = LoggingCombat() and enabled_text or disabled_text,
			label = ADDON_NAME,
			type = "data source",
			OnClick = function(self, button)
				--[[ if button == "RightButton" then
					LoggerHead:ShowConfig()
				end ]]

                if button == "LeftButton" then
                    DT:ShowLog()
					--[[ if LoggingCombat() then
						DT:DisableLogging()
					else
						DT:EnableLogging()
					end ]]
				end
			end,
			OnTooltipShow = function(tooltip)
				tooltip:AddLine(ADDON_NAME)
				tooltip:AddLine(" ")
				tooltip:AddLine("Click to toggle combat logging")
				tooltip:AddLine("Right-click to open the options menu")
			end
		})
		--[[ if LDBIcon then
			LDBIcon:Register(ADDON_NAME, LoggerHeadDS, db.minimap)
			if (not db.minimap.hide) then LDBIcon:Show(ADDON_NAME) end
		end ]]
	end

    -- Setup options

    -- Register chat command
    --self:RegisterChatCommand("dt", function() DT:ShowConfig() end)

    self:RegisterEvents(
        "BOSS_KILL",
        "ENCOUNTER_START",
        "ENCOUNTER_END",

        "CHAT_MSG_LOOT",            -- loot gain
        "CHAT_MSG_MONEY",           -- money gain
        "PLAYER_XP_UPDATE",         -- xp update

        "PLAYER_REGEN_DISABLED",    -- when player becomes in combat
        "PLAYER_REGEN_ENABLED",     -- when player leaves combat
    
        "GROUP_ROSTER_UPDATE",      -- party changed
        "RAID_ROSTER_UPDATE",       -- raid changed
    
        "UPDATE_INSTANCE_INFO",     -- in dungeon/raid instance
        "PLAYER_ENTERING_WORLD",    -- login in the middle of instance

        "COMBAT_LOG_EVENT_UNFILTERED",

        "CHAT_MSG_SYSTEM"
    )

    self:Print("Addon Loaded")
    self:Debug("Addon Loaded")
end

function DT:Debug(text, level)
	if not db or not db.debugMode then return end
	if (level or 1) <= db.debugLevel then
        self:Print("<Debug> "..text)
	end
end

-- Register Events
function DT:RegisterEvents(...)
    for i = 1, select("#", ...) do
        local event = select(i, ...)
        self:RegisterEvent(event,event)
    end
end

function DT:EnsureBossEncounterExists(encounterId, encounterName)
    dungeonLog = self:ActiveDungeon()

    if not dungeonLog then return nil end

    dungeonLog.encounters[encounterID] = {
        id = encounterId,
        name = encounterName,
        bosses = {},
        timeStart = GetServerTime()
    }

    return dungeonLog.encounters[encounterID]
end

function DT:BOSS_KILL(event, encounterId, encounterName)
    if not self:ActiveDungeon() then return end

    self:Debug("BOSS_KILL fired! encounterID="..encounterID..", name="..encounterName)
    bossEncounter = self:EnsureBossEncounterExists(encounterID, encounterName)

    if not bossEncounter then return end

    bossEncounter.timeKill = GetServerTime()
end

--- Ways an encounter can start:
--       ENCOUNTER_START event
--       UNIT_HEALTH event for boss npc
--       boss yell
function DT:StartEncounter(encounterId, name)
    self.EncounterId = encounterId
    bossEncounter = self:EnsureBossEncounterExists(encounterId, name)
    bossEncounter.attempts = bossEncounter.attempts + 1
end

--- Ways an encounter can end:
--       ENCOUNTER_END event
--       BOSS_KILL event for only boss
--       UNIT_DEAD event for only boss
--       boss yell
function DT:EndEncounter(encounterId, name, success)
    bossEncounter = self:EnsureBossEncounterExists(encounterId, name)
    bossEncounter.success = success
    self.EncounterId = nil
end

function DT:ENCOUNTER_START(event, encounterId, name, difficulty, size)
    if not self:ActiveDungeon() then return end

    if self:ActiveBossEncounter() then return end

    self:Debug("ENCOUNTER_START fired! encounterID="..encounterId..", name="..name)
    self:StartEncounter(encounterId, name)
end

function DT:ENCOUNTER_END(event, encounterId, name, difficulty, size, success)
    if not self:ActiveDungeon() then return end

    self:Debug("ENCOUNTER_END fired! encounterID="..encounterId..", name="..name..", success="..success)
    self:EndEncounter(encounterId, name, success)
end

function DT:COMBAT_LOG_EVENT_UNIT_DIED(destGUID, destName)
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    local NPCID = DT_GetNPCIdFromGuid(destGUID)
    dungeonLog:AddKill(NPCID)

    dungeonInfo = _G.DTInstanceInfo[dungeonLog.instance]
    if not dungeonInfo then return end
    
    bossEncounter = self:ActiveBossEncounter()
    if not bossEncounter then return end

    local encounterInfo = dungeonInfo.encounters[bossEncounter.id]
    if not encounterInfo then return end

    local localBossName = destName
    local NPCID = DT_GetNPCIdFromGuid(destGUID)
    local encounterBoss = encounterInfo.bosses[NPCID]
    if encounterBoss then
        self:Debug("Valid NPCID found... - Match on "..encounterBoss.name)
        bossEncounter.bosses[NPCID] = {
            name = localBossName,
            timeKill = GetServerTime()
        }
        if select("#", encounterInfo.bosses) <= 1 then
            self:Debug("Only boss killed ... ending the encounter")
            self:EndEncounter(bossEncounter.id, bossEncounter.name, true)
        end
    end
end

function DT:COMBAT_LOG_EVENT_UNIT_HEALTH(destGUID, destName)
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog or self:ActiveBossEncounter() then return end

    dungeonInfo = _G.DTInstanceInfo[dungeonLog.instance]
    if not dungeonInfo then return end

    local NPCID = DT_GetNPCIdFromGuid(destGUID)
    for key, value in pairs(dungeonInfo.encounters) do
        if value.bosses[NPCID] then
            self:Debug("Starting Encounter by UNIT_HEALTH encounterId="..key..", name="..value.name)
            self:EnsureBossEncounterExists(key, value.name)
            self.EncounterId = key
        end
    end
end

function DT:COMBAT_LOG_EVENT_UNFILTERED(event, ...)
    local _, combatEvent, _, _, _, _, _, destGUID, destName, _, _, spellID = ...;

    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

--[[     local dungeonInfo = DTInstanceInfo[dungeonLog.instance]
    if not dungeonInfo then return end ]]

    if (combatEvent == "UNIT_DIED") then
        self:COMBAT_LOG_EVENT_UNIT_DIED(destGUID, destName)
    elseif (combatEvent == "UNIT_HEALTH") then
        self:COMBAT_LOG_EVENT_UNIT_HEALTH(destGUID, destName)
    end
end

function DT:PLAYER_REGEN_DISABLED()
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    dungeonLog:StartCombat()
    --[[ if dungeonLog and not dungeonLog.timeFirstPull then
        self:Debug("First pull")
        dbGlobal.dungeonLog[self.DungeonId].timeFirstPull = GetServerTime()
    end ]]
end

function DT:PLAYER_REGEN_ENABLED()
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    dungeonLog:EndCombat()
    --[[ self:Debug("Last kill")
    dbGlobal.dungeonLog[self.DungeonId].timeLastKill = GetServerTime() ]]
end

--[[ function DT:EnsurePlayerExists(playerName, playerClass, playerLevel)
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then 
        self:Debug("Trying to create player for dungeon log that doesn't exist.")
        return nil 
    end

    return dungeonLog:EnsurePlayerExists(playerName, playerClass, playerLevel)

    if not playerClass then
        self:Debug("Ensuring '"..playerName.."' exists")
        local className, classFilename, classID = UnitClass(playerName)
        playerClass = className
    end

    dbGlobal.dungeonLog[self.DungeonId].players[playerName] = {
        name = playerName,
        class = playerClass,
        level = playerLevel or UnitLevel(playerName),
        timeJoined = GetServerTime(),
        timeLeft = nill
    }

    return dbGlobal.dungeonLog[self.DungeonId].players[playerName]
end ]]

function DT:ActiveDungeon()
    if not self.DungeonId then return nil end

    return dbGlobal.dungeonLog[self.DungeonId]
end

function DT:ActiveBossEncounter()
    dungeonLog = self:ActiveDungeon()

    if not dungeonLog and not self.EncounterId then return nil end

    return dungeonLog.encounters[self.EncounterId]
end

--[[ function DT:GetItemId(itemLink)
    return itemLink
end

function DT:GetPlayerId(playername)
    return playername
end ]]

function DT:AddLoot(playerKey, itemLink, itemCount)
    
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    itemName, _, itemRarity, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(itemLink)

    if itemRarity <= db.vendorTrashLevel then
        dungeonLog:AddVendorTrash(itemSellPrice)
    else
        dungeonLog:AddLoot(playerKey, itemLink, itemCount)
    end

    --[[ itemName, _, itemRarity, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(itemLink)

    if itemRarity <= db.vendorTrashLevel then
        dungeonLog.lootMoney = dungeonLog.lootMoney + itemSellPrice
        return
    end

    --itemId = self:GetItemId(itemLink)
    --playerId = self:GetPlayerId(playerName)

    dungeonLog.loot[dungeonLog.lootCount] = {
        link = itemLink,
        count = itemCount,
        recipient = playerName
    }
    dungeonLog.lootCount = dungeonLog.lootCount + 1 ]]
end

function DT:CHAT_MSG_LOOT(event, text, ...)
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    local playerName, itemLink, itemCount = self:GetLootFromChatLog(text)
    if playerName then
        playerKey = dungeonLog:EnsurePlayerExists(playerName)
        self:AddLoot(playerKey, itemLink, itemCount)
    end
end

function DT:GetLootFromChatLog(chatmsg)
    -- patterns LOOT_ITEM / LOOT_ITEM_SELF are also valid for LOOT_ITEM_MULTIPLE / LOOT_ITEM_SELF_MULTIPLE - but not the other way around - try these first
    -- first try: somebody else received multiple loot (most parameters)
    local playerName, itemLink, itemCount = string.match(chatmsg, L["LOOT_ITEM_MULTIPLE"]);
    -- next try: somebody else received single loot
    if (playerName == nil) then
        itemCount = 1;
        playerName, itemLink = string.match(chatmsg, L["LOOT_ITEM"]);
    end
    -- if player == nil, then next try: player received multiple loot
    if (playerName == nil) then
        playerName = UnitName("player");
        itemLink, itemCount = string.match(chatmsg, L["LOOT_ITEM_SELF_MULTIPLE"]);
    end
    -- if itemLink == nil, then last try: player received single loot
    if (itemLink == nil) then
        itemCount = 1;
        itemLink = string.match(chatmsg, L["LOOT_ITEM_SELF"]);
    end

    -- if itemLink == nil, then there was neither a LOOT_ITEM, nor a LOOT_ITEM_SELF message
    -- "You receive item: " (from trade) ignore
    if (itemLink == nil) then 
        -- MRT_Debug("No valid loot event received."); 
        return; 
    end
	-- if code reaches this point, we should have a valid looter and a valid itemLink
    self:Debug("Loot gain: Looter is "..playerName.." and loot is "..itemLink.." (quantity: "..itemCount..")");
    
    return playerName, itemLink, itemCount
end	

function DT:CHAT_MSG_MONEY(event, text, ...)
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    dungeonLog:MoneyUpdated()

    --[[ local moneyGained = GetMoney("player") - dungeonLog.startingMoney
    self:Debug("Money gain: '"..moneyGained.."'")
    dungeonLog.money = moneyGained ]]
end

function DT:PLAYER_XP_UPDATE()
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    dungeonLog:XPUpdated()

--[[     local xpGained = self:GetPlayerTotalXP(UnitLevel("player"), UnitXP("player")) - dungeonLog.startingXP
    self:Debug("XP Gain: '"..xpGained.."'")
    dungeonLog.xp = xpGained ]]
end

function DT:GROUP_ROSTER_UPDATE()
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    self:Debug("Party changed")
    dungeonLog:AddGroupMembers()
end

function DT:RAID_ROSTER_UPDATE()
    dungeonLog = self:ActiveDungeon()
    if not dungeonLog then return end

    self:Debug("Raid roster changed")
    dungeonLog:AddGroupMembers()
end

function DT:CHAT_MSG_SYSTEM(event, text)
    local instance = string.match(text, L["INSTANCE_RESET"]);

    if not instance then return end

    self:Debug("Resetting the instance '"..instance.."'.")
end

--[[ function DT:GetPlayerTotalXP(currentLevel, xpInCurrentLevel)
    if currentLevel < 1 then
        currentLevel = 1
    end

    if currentLevel > 60 then
        currentLevel = 60
    end

    return DTLevelInfo[currentLevel] + xpInCurrentLevel
end ]]

--[[ function DT:AddGroupMembers()
    local memberCount = 1
    if IsInRaid() then
        memberCount = GetNumGroupMembers()
        for memberIndex = 1, memberCount do
            local name, _, _, level, class = DT_GetRaidRosterInfo(memberIndex)
            self:EnsurePlayerExists(name, class, level)
        end
    elseif IsInGroup() then
        memberCount = GetNumGroupMembers()
        for memberIndex = 1, memberCount-1 do
            self:Debug("party"..memberIndex.." of "..memberCount-1)
            local name, realm = UnitName("party"..memberIndex)
            self:Debug("Adding player '"..name.."'")
            self:EnsurePlayerExists(name)
        end
    end
end ]]

function DT:AddDungeonLog(dungeonId, mapid, zone)
    self.DungeonId = dungeonId;
    dbGlobal.dungeonLog[dungeonId] = DungeonLog:new(mapid, zone)
    --[[ dbGlobal.dungeonLog[dungeonId] = {
        instanceId = mapid,
        instance = zone,
        character = UnitName("player"),

        startingXP = self:GetPlayerTotalXP(UnitLevel("player"), UnitXP("player")),
        xp = 0,

        startingMoney = GetMoney("player"),
        lootMoney = 0,
        money = 0, -- expressed in terms of copper

        timeStart = GetServerTime(),
        timeFirstPull = nil,
        timeLastKill = nil,
        timeEnd = nil,

        players = {},
        bosses = {},
        loot = {},
        lootCount = 0
    } ]]
end

function DT:AddDungeonReset(zone, resetTime)
    local zoneResetTime = dbGlobal.resetTimers[zone]

    if zoneResetTime and zoneResetTime ~= resetTime then
        -- this shouldn't happen
    end

    dbGlobal.resetTimers[zone] = resetTime
end

function DT:HasInstanceReset(zone)
    local zoneResetTime = dbGlobal.resetTimers[zone]
    if zoneResetTime and zoneResetTime > GetServerTime() then return true end

    return false
end

function DT:UPDATE_INSTANCE_INFO()
    -- Check if it is a dungeon or raid 
    -- Create a new instance run if one is not already going
    local zone, zonetype, difficultyIndex, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, mapid = GetInstanceInfo()
    if not zone then return end
    if zone == self.LastZone then
        -- do nothing if the zone hasn't ACTUALLY changed
        -- otherwise we may override the user's manual enable/disable
        return
    end
    self.LastZone = zone
    local dateTimeStamp = date("%y%m%d%H%M%S")
    if zonetype ~= "none" and zonetype and zone and mapid then
        self:Print("Tracking ("..zone..") - "..dateTimeStamp)
        self:AddDungeonLog(dateTimeStamp.."_"..mapid, mapid, zone)
        self:AddGroupMembers()
        return
    end
    if self.DungeonId ~= null then
        local dungeonLog = self:ActiveDungeon()
        self:Print("Finish ("..dungeonLog.instance..") - "..dateTimeStamp)
        dbGlobal.dungeonLog[self.DungeonId].timeEnd = GetServerTime()
        -- Regular instances
        self:AddDungeonReset(dungeonLog.instance, GetServerTime() + 30*60)
        -- Raid instances
    end
    self.DungeonId = nil
end

function DT:PLAYER_ENTERING_WORLD()
    -- Check if player is in a dungeon or raid
    -- Create a new instance run if one is not already going
    self:Debug("Player entering world")
end

function DT:GetGroupLevel(dungeonLog)
    if not dungeonLog then return end

    local totalLevel = 0
    local playerCount = 0

    for key, value in pairs(dungeonLog.players) do
        totalLevel = totalLevel + value.level
        playerCount = playerCount + 1
    end

    if playerCount == 0 then return "N/A" end

    return floor(totalLevel / playerCount + 0.5)
end

function DT:GetInstanceTime(dungeonLog)
    if not dungeonLog then return end

    return (dungeonLog.timeLastKill or dungeonLog.timeEnd or 0) - (dungeonLog.timeFirstPull or dungeonLog.timeStart or 0)
end

function DT:GetDataTable()
    local t = { }
    for key, value in pairs(dbGlobal.dungeonLog) do
        local playerKey = DungeonLog.EnsurePlayerExists(value, value.character)
        local character = value.players[playerKey]
        if (character and (db.filterOptions.onlyShowCurrentCharacter == false or value.character == UnitName("player"))) and
            (db.filterOptions.instanceFilter == nil or value.instance == db.filterOptions.instanceFilter) then
            local instanceInfo = DTInstanceInfo[value.instance] or DTEmptyLevelRange or nil
            table.insert(t, {
                DT_GetDateString(value.timeStart),          -- date
                value.instance,     -- instance
                DT_ColoriseByClass(value.character, character.class),    -- character
                DT_ColoriseLevel(character.level,instanceInfo.levelRanges).." ["..DT_ColoriseLevel(DT:GetGroupLevel(value),instanceInfo.levelRanges).."]",          -- level
                DT_GetTimeString(DT:GetInstanceTime(value)),          -- time
                value.xp or 0,      -- xp
                DT_GetMoneyString((value.money or 0) + (value.lootMoney or 0))    -- money
            })
        end
    end

    local sort_func = function(a,b)
        return a[1] > b[1]
    end

    table.sort(t, sort_func)
    
    return t
end

function DT:UpdateLog()
	local buttons = HybridScrollFrame_GetButtons(scroll);
	local offset = HybridScrollFrame_GetOffset(scroll);
    
    local rows = self:GetDataTable();

    self:Debug(#rows)

	for buttonIndex = 1, #buttons do
		local button = buttons[buttonIndex];
		local itemIndex = buttonIndex + offset;

		if (itemIndex <= #rows) then
            local dateString, instance, character, level, timeString, xp, money = unpack(rows[itemIndex])
			
			button:SetID(itemIndex);
			button.Date:SetText(dateString);
			button.Instance:SetText(instance);
			button.Character:SetText(character);
			button.Level:SetText(level);
			button.Time:SetText(timeString);
			button.XP:SetText(xp);
			button.Gold:SetText(money);

			--[[ if (name == playerName) then
				button.Background:SetColorTexture(0.5, 0.5, 0.5, 0.2)
			else ]]
				button.Background:SetColorTexture(0, 0, 0, 0.2)
			--end
			button.Highlight:SetColorTexture(1, 0.75, 0, 0.2)

			button:Show();
		else
			button:Hide();
		end
	end

	local buttonHeight = scroll.buttonHeight;
	local totalHeight = #dbGlobal.dungeonLog * buttonHeight;
	local shownHeight = #buttons * buttonHeight;

	HybridScrollFrame_Update(scroll, totalHeight, shownHeight);
end

function DT:CreateListItemTemplate()
    
end

function DT:GetInstanceList()
    instanceList = {
        ["ALL"] = "All Instances"
    }

    for key, value in pairs(dbGlobal.dungeonLog) do
        local character = value.players[value.character]
        if (db.filterOptions.onlyShowCurrentCharacter == false or value.character == UnitName("player")) then
            if instanceList[value.instance] == nil then
                instanceList[value.instance] = value.instance
            end
        end
    end

    return instanceList
end

function DT:GetInstanceSorted(instanceList)
    fullList = {
        "ALL", "Ragefire Chasm", "Wailing Caverns", "The Deadmines", "Shadowfang Keep", "Blackfathom Deeps", "The Stockade",
        "Gnomeregan", "Razorfen Kraul", "Scarlet Monastery", "Razorfen Downs", "Uldaman", "Zul'Farrak", "Maraudon",
        "The Temple of Atal'Hakkar", "Blackrock Depths", "Lower Blackrock Spire", "Upper Blackrock Spire", "Dire Maul East",
        "Dire Maul West", "Dire Maul North", "Scholomance", "Stratholme", "Molten Core", "Onyxia's Lair", "Blackwing Lair",
        "Zul'Gurub", "Ruins of Ahn'Qiraj", "Temple of Ahn'Qiraj", "Naxxramas"
    }

    sortedList = { }

    for key, value in ipairs(fullList) do
        if instanceList[value] ~= nil then
            table.insert(sortedList, value)
        end
    end

    return sortedList
end

function DT:ShowLog()
    local frame = AceGUI:Create("Frame")
    frame:SetTitle("Dungeon Log")

    -- Filters
    local filterTable = AceGUI:Create("SimpleGroup")
    filterTable:SetFullWidth(true)
    filterTable:SetLayout("Flow")
    frame:AddChild(filterTable)

    local profileLabel = AceGUI:Create("Label")
    profileLabel:SetText("Profile")
    profileLabel:SetWidth(50)
    filterTable:AddChild(profileLabel)

    local profileDropdown = AceGUI:Create("Dropdown")
    profileDropdown:SetList({
        ["GEN"] = "General",
        ["LVL"] = "Leveling",
        ["FARM"] = "Farming",
        ["CLOTH"] = "Cloth Farming",
        ["HERB"] = "Herb Farming",
        ["ORE"] = "Ore Farming"
    }, { "GEN", "LVL", "FARM", "CLOTH", "HERB", "ORE" })
    profileDropdown:SetText("General")
    profileDropdown:SetWidth(150)
    profileDropdown:SetCallback("OnValueChanged", function(key)
        -- Set config setting
        DT:UpdateLog()
    end)
    filterTable:AddChild(profileDropdown)

    local instanceLabel = AceGUI:Create("Label")
    instanceLabel:SetText("Instances")
    instanceLabel:SetWidth(60)
    instanceLabel:SetPoint("LEFT", -10, 0)
    filterTable:AddChild(instanceLabel)

    local instanceList = DT:GetInstanceList()
    local instanceSorted = DT:GetInstanceSorted(instanceList)

    local instanceDropdown = AceGUI:Create("Dropdown")
    instanceDropdown:SetList(instanceList, { "ALL", "Ragefire Chasm", "Wailing Caverns" })
    instanceDropdown:SetText("All Instances")
    instanceDropdown:SetCallback("OnValueChanged", function(widget, eventname, key)
        if key == "ALL" then
            db.filterOptions.instanceFilter = nil
        else
            db.filterOptions.instanceFilter = key
        end
        DT:UpdateLog()
    end)
    filterTable:AddChild(instanceDropdown)

    local currentCharacterFlag = AceGUI:Create("CheckBox")
    currentCharacterFlag:SetLabel("Only my dungeons")
    currentCharacterFlag:SetType("checkbox")
    currentCharacterFlag:SetValue(db.filterOptions.onlyShowCurrentCharacter)
    currentCharacterFlag:SetWidth(150)
    currentCharacterFlag:SetCallback("OnValueChanged", function(widget, eventname, newValue)
        -- Set config setting
        db.filterOptions.onlyShowCurrentCharacter = newValue
        DT:UpdateLog()
    end)
    filterTable:AddChild(currentCharacterFlag)

    -- Table Heading
    local tableHeader = AceGUI:Create("SimpleGroup")
	tableHeader:SetFullWidth(true)
	tableHeader:SetLayout("Flow")
	frame:AddChild(tableHeader)

	local btn = AceGUI:Create("InteractiveLabel")
	btn:SetWidth(120)
	btn:SetText("Date")
	tableHeader:AddChild(btn)

	btn = AceGUI:Create("InteractiveLabel")
--[[ 	btn:SetCallback("OnClick", function()
		GUI:Show(false, L["Honor"])
	end)
	btn.highlight:SetColorTexture(0.3, 0.3, 0.3, 0.5) ]]
	btn:SetWidth(150)
	btn:SetText("Instance")
	tableHeader:AddChild(btn)

	btn = AceGUI:Create("InteractiveLabel")
	btn:SetWidth(80)
	btn:SetText("Character")
	tableHeader:AddChild(btn)

	btn = AceGUI:Create("InteractiveLabel")
	--[[ btn:SetCallback("OnClick", function()
		GUI:Show(false, L["Standing"])
	end)
	btn.highlight:SetColorTexture(0.3, 0.3, 0.3, 0.5) ]]
	btn:SetWidth(50)
	btn:SetText("Level")
	tableHeader:AddChild(btn)

	btn = AceGUI:Create("InteractiveLabel")
	btn:SetWidth(70)
	btn:SetText("Time")
	tableHeader:AddChild(btn)

	btn = AceGUI:Create("InteractiveLabel")
	--[[ btn:SetCallback("OnClick", function()
		GUI:Show(false, L["Rank"])
	end)
	btn.highlight:SetColorTexture(0.3, 0.3, 0.3, 0.5) ]]
	btn:SetWidth(50)
	btn:SetText("XP")
	tableHeader:AddChild(btn)

	btn = AceGUI:Create("InteractiveLabel")
	btn:SetWidth(80)
	btn:SetText("Gold")
	tableHeader:AddChild(btn)

	scrollcontainer = AceGUI:Create("SimpleGroup")
	scrollcontainer:SetFullWidth(true)
	scrollcontainer:SetHeight(390)
	scrollcontainer:SetLayout("Fill")
	frame:AddChild(scrollcontainer)
	scrollcontainer:ClearAllPoints()
	scrollcontainer.frame:SetPoint("TOP", tableHeader.frame, "BOTTOM", 0, 0)
	scrollcontainer.frame:SetPoint("BOTTOM", 0, 20)

	scroll = CreateFrame("ScrollFrame", nil, scrollcontainer.frame, "DungeonTrackerLogFrame")
	HybridScrollFrame_CreateButtons(scroll, "DungeonTrackerListItemTemplate");
	HybridScrollFrame_SetDoNotHideScrollBar(scroll, true)
	scroll.update = function() DT:UpdateLog() end

	-- statusLine = AceGUI:Create("Label")
	-- statusLine:SetFullWidth(true)
	-- frame:AddChild(statusLine)
	-- statusLine:ClearAllPoints()
    -- statusLine:SetPoint("BOTTOM", frame.frame, "BOTTOM", 0, 15)
    
    DT:UpdateLog()
end

-- |Date|Instance|Character|Level|Time|XP|Gold|PartyMembers|