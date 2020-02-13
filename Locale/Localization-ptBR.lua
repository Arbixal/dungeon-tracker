local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"ptBR")
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*) dies, you gain (%d+) experience.";