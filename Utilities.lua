function DT_GetNPCIdFromGuid(guid)
    -- Creature-0-4671-389-32075-11320-0004ACF208
    -- Player-4667-005D46A4

    local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-",guid);

    if type == "Creature" then
        return npc_id
    else
        return nil
    end
end

function DT_GetItemIdFromItemLink(itemLink)
    i, j = string.find(itemLink, "item:(%d+)")

    return string.sub(itemLink, i+5, j)
end

function DT_GetPlayerTotalXP(currentLevel, xpInCurrentLevel)
    if currentLevel < 1 then
        currentLevel = 1
    end

    if currentLevel > 60 then
        currentLevel = 60
    end

    return _G.DTLevelInfo[currentLevel] + xpInCurrentLevel
end

--- Gets information about the group member at the given index
-- @param index The index for the group/raid member that requires information
function DT_GetRaidRosterInfo(index)
    if IsInRaid() then
        return GetRaidRosterInfo(index)
    end

    local UnitID = "player"
    if IsInRaid() then
        UnitID = "raid"..index
    elseif IsInGroup() then
        UnitID = "party"..index
    end

    local name = GetUnitName(UnitID);
	local rank = 0;
	local subgroup = 1;
	local level = UnitLevel(UnitID);
	local class,fileName = UnitClass(UnitID);
	local zone = GetRealZoneText();
	local online = UnitIsConnected(UnitID);
	local isDead = UnitIsDead(UnitID);
	local role = nil;
	local isML = nil;
	local combatRole = nil;
	
	return name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML, combatRole;
end

function DT_GetMoneyString(value)
    local neg1 = ""
    local neg2 = ""
    local agold = 10000;
    local asilver = 100;
    local outstr = "";
    local gold = 0;
    local gold_str = ""
    local gc = "|cFFFFFF00"
    local silver = 0;
    local silver_str = ""
    local sc = "|cFFCCCCCC"
    local copper = 0;
    local copper_str = ""
    local cc = "|cFFFF6600"
    local amount = (value or 0)
    local cash = (amount or 0)
    local font_size = 10
    local icon_pre = "|TInterface\\MoneyFrame\\"
    local icon_post = ":"..font_size..":"..font_size..":2:0|t"
    local g_icon = icon_pre.."UI-GoldIcon"..icon_post
    local s_icon = icon_pre.."UI-SilverIcon"..icon_post
    local c_icon = icon_pre.."UI-CopperIcon"..icon_post

    if amount < 0 then
        neg1 = "|cFFFF6600" .."("..FONT_COLOR_CODE_CLOSE
        neg2 = "|cFFFF6600" ..")"..FONT_COLOR_CODE_CLOSE
    else
        neg2 = " " -- need to pad for other negative numbers
    end
    if amount < 0 then
        amount = amount * -1
    end
    
    if amount == 0 then
        copper_str = cc..(amount or "?")..c_icon..""..FONT_COLOR_CODE_CLOSE
    elseif amount > 0 then
        -- figure out the gold - silver - copper components
        gold = (math.floor(amount / agold) or 0)
        amount = amount - (gold * agold);
        silver = (math.floor(amount / asilver) or 0)
        copper = amount - (silver * asilver)
        -- now make the coin strings
        if gold > 0 then
            gold_str = gc..(gold or "?")..g_icon.." "..FONT_COLOR_CODE_CLOSE
            silver_str = sc..(string.format("%02d", silver) or "?")..s_icon.." "..FONT_COLOR_CODE_CLOSE
            copper_str = cc..(string.format("%02d", copper) or "?")..c_icon..""..FONT_COLOR_CODE_CLOSE
        elseif (silver > 0) then
            silver_str = sc..(silver or "?")..s_icon.." "..FONT_COLOR_CODE_CLOSE
            copper_str = cc..(string.format("%02d", copper) or "?")..c_icon..""..FONT_COLOR_CODE_CLOSE
        elseif (copper > 0) then
            copper_str = cc..(copper or "?")..c_icon..""..FONT_COLOR_CODE_CLOSE
        end
    end

    -- build the return string
    outstr = outstr
        ..neg1
        ..gold_str
        ..silver_str
        ..copper_str
        ..neg2
    return outstr, cash, gold, silver, copper
end

function DT_GetDateString(dateTime)
    return date("%Y-%m-%d %H:%M:%S", dateTime)
end

function DT_GetRelativeDateString(dateTime, relativeTo)
    local day = date("%A", dateTime)
    local hour = date("%I", dateTime):match("0*(%d+)")

    if date("%x", dateTime) == date("%x", relativeTo) then
        day = "Today"
    elseif date("%x", dateTime) == date("%x", relativeTo+86400) then
        day = "Tomorrow"
    end

    return day.." @ "..hour.."am"
end

function DT_GetTimeParts(s)
	local days = 0
	local hours = 0
	local minutes = 0
	local seconds = 0
	if not s or (s < 0) then
		seconds = "N/A"
	else
		days = floor(s/24/60/60); s = mod(s, 24*60*60);
		hours = floor(s/60/60); s = mod(s, 60*60);
		minutes = floor(s/60); s = mod(s, 60);
		seconds = s;
	end

	return days, hours, minutes, seconds
end

function DT_GetTimeString(dateTime)
    local timeText = "";
    local days, hours, minutes, seconds = DT_GetTimeParts(dateTime)
    if seconds == "N/A" then
        timeText = "N/A";
    else
        if (days ~= 0) then
            timeText = timeText..format("%dd ", days);
        end
        if (days ~= 0 or hours ~= 0) then
            timeText = timeText..format("%dh ", hours);
        end
        if (days ~= 0 or hours ~= 0 or minutes ~= 0) then
            timeText = timeText..format("%dm ", minutes);
        end
        timeText = timeText..format("%ds", seconds);
    end
    return timeText;
end

function DT_ColoriseByClass(textValue, className)
    if not className then return textValue end

    local classColour = RAID_CLASS_COLORS[string.upper(className)]
    if not classColour then return textValue end

    textValue = ("|cFF%02X%02X%02X%s|r"):format(classColour.r * 255, classColour.g * 255, classColour.b * 255, textValue)

    return textValue
end

function DT_ColoriseByLevel(textValue, level, thresholds)
    if not level or not thresholds then return textValue end

    local color = DTColours.Red
    if thresholds[DTColours.Orange] and level >= thresholds[DTColours.Orange] then
        color = DTColours.Orange
    end

    if thresholds[DTColours.Yellow] and level >= thresholds[DTColours.Yellow] then
        color = DTColours.Yellow
    end

    if thresholds[DTColours.Green] and level >= thresholds[DTColours.Green] then
        color = DTColours.Green
    end

    if thresholds[DTColours.Grey] and level >= thresholds[DTColours.Grey] then
        color = DTColours.Grey
    end

    return ("|r%s%s|r"):format(color,textValue)
end

function DT_ColoriseLevel(level, thresholds)
    return DT_ColoriseByLevel(level, level, thresholds)
end