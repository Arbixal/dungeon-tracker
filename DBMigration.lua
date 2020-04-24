function DT_MigrateV1_To_V2(db, globalDB)
    
    newDungeonLog = {}

    for key, value in pairs(globalDB.dungeonLog) do
        -- remove logs that don't gain xp or money or loot, or is missing the player for the player list
        if (value.xp and value.xp > 0) or (value.money and value.money > 0) or (value.lootMoney and value.lootMoney > 0) or (value.loot and next(value.loot) ~= nil) then

            playerObject = nil

            for playerKey, playerValue in pairs(value.players) do
                if playerValue.name == value.character then
                    playerObject = playerValue
                    break
                end
            end

            if playerObject then
                -- deal with xp difference (previously was just relative to current level)
                newStartingXP = _G.DT_GetPlayerTotalXP(playerObject.level, value.startingXP)
                newXP = value.xp
                if value.xp < 0 then
                    newXP = _G.DT_GetPlayerTotalXP(playerObject.level + 1, value.xp + value.startingXP) - _G.DT_GetPlayerTotalXP(playerObject.level, value.startingXP)
                end

                -- create new log
                dungeonLog = DungeonLog:clone(
                    {
                        startingMoney = value.startingMoney,
                        startingXP = newStartingXP,
                        instanceId = value.instanceId,
                        instance = value.instance,
                        xp = newXP,
                        timeStart = value.timeStart,
                        character = value.character,
                        money = value.money,
                        lootMoney = value.lootMoney,
                        timeEnd = value.timeEnd
                    })
                
                local playerHash = {}
                if value.players then
                    DungeonConsole:Debug("Migrating other party members")
                    for playerKey2, playerValue2 in pairs(value.players) do
                        newPlayerKey = dungeonLog:EnsurePlayerExists(playerValue2.name, playerValue2.class, playerValue2.level, playerValue2.timeJoined)
                        playerHash[playerValue2.name] = newPlayerKey
                    end
                end

                if value.loot then
                    DungeonConsole:Debug("Migrating loot")
                    for lootKey, lootValue in pairs(value.loot) do
                        itemName, _, itemRarity, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(lootValue.link)

                        if itemRarity and itemRarity <= db.vendorTrashLevel then
                            dungeonLog:AddVendorTrash(itemSellPrice)
                        else
                            recipientKey = playerHash[lootValue.recipient]
                            if recipientKey then
                                dungeonLog:AddLoot(recipientKey, lootValue.link, lootValue.count)
                            end
                        end
                    end
                end

                newDungeonLog[key] = dungeonLog
            end
        end
    end
    
    return newDungeonLog
end

