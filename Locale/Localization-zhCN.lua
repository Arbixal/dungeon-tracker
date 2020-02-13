local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"zhCN")
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*)死亡，你获得(%d+)点经验。";