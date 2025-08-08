RegisterNUICallback('createCharacter', function(data, cb)
    TriggerServerEvent('multiChar:createCharacter', data)
    cb('ok')
end)

RegisterNUICallback('selectCharacter', function(data, cb)
    SetNuiFocus(false, false)
    -- Spawn logic here
    cb('ok')
end)

RegisterNetEvent('multiChar:sendCharacters')
AddEventHandler('multiChar:sendCharacters', function(characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'showUI',
        characters = characters
    })
end)

-- Trigger character selection on player spawn
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('multiChar:getCharacters')
end)
