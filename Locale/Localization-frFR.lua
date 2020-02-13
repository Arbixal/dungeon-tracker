local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"enUS")
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*) meurt, vous gagnez (%d+) points d'expérience.";