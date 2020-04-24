DungeonPlayer = {
    name = nil, --playerName,
    class = nil, --playerClass,
    level = nil, --playerLevel or UnitLevel(playerName),
    timeJoined = nil, --GetServerTime(),
    timeLeft = nil
}

function DungeonPlayer:new (playerName, playerClass, playerLevel, timeJoined)
    o = {}
    setmetatable(o, self)
    self.__index = self

    o.name = playerName
    o.class = playerClass
    o.level = playerLevel or UnitLevel(playerName)
    o.timeJoined = timeJoined or GetServerTime()

    return o
end