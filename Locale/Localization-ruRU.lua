local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"ruRU")
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*) погибает, вы получаете (%d+) |4очко:очка:очков; опыта.";