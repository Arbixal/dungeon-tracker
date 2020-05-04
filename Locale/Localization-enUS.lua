local ADDON_NAME, ADDON_TABLE = ...
local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME,"enUS",true)
if not L then return end

L["XP_GAIN_PATTERN"] = "(.*) dies, you gain (%d+) experience."

L["LOOT_ITEM_MULTIPLE"] = "(.+) receives loot: (.+)x(%d+)."
L["LOOT_ITEM"] = "(.+) receives loot: (.+)."
L["LOOT_ITEM_SELF_MULTIPLE"] = "You receive loot: (.+)x(%d+)."
L["LOOT_ITEM_SELF"] = "You receive loot: (.+)."
L["INSTANCE_RESET"] = "(.+) has been reset"

L["new-instance-title"] = "New Instance?"
L["new-instance-question"] = "Is this a new instance? (has the instance been reset)"
L["Yes"] = "Yes"
L["No"] = "No"

--|cff9d9d9d|Hitem:3676::::::::40:::::::|h[Slimy Ichor]|h|r