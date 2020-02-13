local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"zhTW")
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*)死亡，你獲得(%d+)點經驗。";