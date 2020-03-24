local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"enUS",true)
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*) dies, you gain (%d+) experience."

L["LOOT_ITEM_MULTIPLE"] = "(.+) receives loot: (.+)x(%d+)."
L["LOOT_ITEM"] = "(.+) receives loot: (%s+)."
L["LOOT_ITEM_SELF_MULTIPLE"] = "You receive loot: (.+)x(%d+)."
L["LOOT_ITEM_SELF"] = "You receive loot: (.+)."
L["INSTANCE_RESET"] = "%s has been reset"

--|cff9d9d9d|Hitem:3676::::::::40:::::::|h[Slimy Ichor]|h|r