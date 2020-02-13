local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"koKR")
if not L then return end

L["XP_GAIN_PATTERN"] = "%1$s|1이;가; 죽었습니다. %2$d의 경험치를 획득했습니다.";