local characters = {}

RegisterNetEvent('multiChar:getCharacters')
AddEventHandler('multiChar:getCharacters', function()
    local src = source
    local steamID = GetPlayerIdentifiers(src)[1]
    if not characters[steamID] then characters[steamID] = {} end
    TriggerClientEvent('multiChar:sendCharacters', src, characters[steamID])
end)

RegisterNetEvent('multiChar:createCharacter')
AddEventHandler('multiChar:createCharacter', function(data)
    local src = source
    local steamID = GetPlayerIdentifiers(src)[1]
    if not characters[steamID] then characters[steamID] = {} end
    table.insert(characters[steamID], data)
    TriggerClientEvent('multiChar:sendCharacters', src, characters[steamID])
end)
