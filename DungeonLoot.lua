DungeonLoot = {
    --link = nil,
    itemId = nil,
    --count = nil,
    recipients = nil
}

function DungeonLoot:new (itemLink)
    o = {}
    setmetatable(o, self)
    self.__index = self

    --o.link = itemLink
    o.itemId = _G.DT_GetItemIdFromItemLink(itemLink)
    o.recipients = {}

    return o
end

function DungeonLoot:AddRecipient(playerKey, itemCount)
    if not self.recipients[playerKey] then
        self.recipients[playerKey] = 0
    end

    self.recipients[playerKey] = self.recipients[playerKey] + itemCount
end