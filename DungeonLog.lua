DungeonLog = {
    instanceId = nil, --mapid,
    instance = nil, --zone,
    character = nil, --UnitName("player"),

    startingXP = 0, --self:GetPlayerTotalXP(UnitLevel("player"), UnitXP("player")),
    xp = 0,

    startingMoney = 0, --GetMoney("player"),
    lootMoney = 0,
    money = 0, -- expressed in terms of copper

    timeStart = nil, --GetServerTime(),
    timeFirstPull = nil,
    timeLastKill = nil,
    timeEnd = nil,

    players = nil,
    kills = nil,
    bosses = nil,
    loot = nil
}

function DungeonLog:clone(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    o.players = {}
    o.kills = {}
    o.bosses = {}
    o.loot = {}

    return o
end

function DungeonLog:new (mapid, zone)
    o = {}
    setmetatable(o, self)
    self.__index = self

    o.instanceId = mapid
    o.instance = zone
    o.character = UnitName("player")
    o.startingXP = DT_GetPlayerTotalXP(UnitLevel("player"), UnitXP("player"))
    o.startingMoney = GetMoney("player")
    o.timeStart = GetServerTime()

    o.players = {}
    o.kills = {}
    o.bosses = {}
    o.loot = {}

    return o
end

function DungeonLog:AddKill(npcId, npcLevel)
    if not npcId then return end

    if not self.kills[npcId] then
        self.kills[npcId] = {}
    end

    if not npcLevel then
        npcLevel = -1
    end

    if not self.kills[npcId][npcLevel] then
        --DungeonConsole:Debug("Creating NPC kill")
        self.kills[npcId][npcLevel] = 0
    end

    --DungeonConsole:Debug("Incrementing kill counter for "..npcId)
    self.kills[npcId][npcLevel] = self.kills[npcId][npcLevel] + 1
end

function DungeonLog:AddLoot(playerKey, itemLink, itemCount)
    local itemId = _G.DT_GetItemIdFromItemLink(itemLink)

    if not self.loot[itemId] then
        --DungeonConsole:Debug("Creating loot item: "..itemId)
        self.loot[itemId] = DungeonLoot:new(itemLink)
    end

    --DungeonConsole:Debug("Adding recipient "..playerKey.." to item")
    self.loot[itemId]:AddRecipient(playerKey, itemCount)
end

function DungeonLog:AddVendorTrash(money)
    self.lootMoney = self.lootMoney + money
end

-- Combat Events
function DungeonLog:StartCombat()
    if not self.timeFirstPull then
        self.timeFirstPull = GetServerTime()
    end
end

function DungeonLog:EndCombat()
    self.timeLastKill = GetServerTime()
end

function DungeonLog:XPUpdated()
    local xpGained = DT_GetPlayerTotalXP(UnitLevel("player"), UnitXP("player")) - self.startingXP
    --self:Debug("XP Gain: '"..xpGained.."'")
    self.xp = xpGained
end

function DungeonLog:MoneyUpdated()
    local moneyGained = GetMoney("player") - self.startingMoney
    --self:Debug("Money gain: '"..moneyGained.."'")
    self.money = moneyGained
end

function DungeonLog:EnsurePlayerExists(playerName, playerClass, playerLevel, timeJoined)
    --DungeonConsole:Debug("Ensuring '"..playerName.."' exists")

    playerKey = nil
    local nextKey = 1
    for key, value in pairs(self.players) do
        if value.name == playerName then
            playerKey = key
            --DungeonConsole:Debug("'"..playerName.."' found as "..playerKey)
            break
        end

        nextKey = nextKey + 1
    end

    if not playerKey then
        if not playerClass then
            --DungeonConsole:Debug("Getting class for '"..playerName.."'")
            local className, classFilename, classID = UnitClass(playerName)
            playerClass = className
        end

        --DungeonConsole:Debug("Creating '"..playerName.."'")
        self.players[nextKey] = DungeonPlayer:new(playerName, playerClass, playerLevel, timeJoined)
        playerKey = nextKey
    end

    return playerKey
end