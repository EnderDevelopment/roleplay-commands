local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local cooldowns = {}

RegisterCommand('do', function(source, args, rawCommand)
    if not Config.DoCommand.enabled then return end
    
    local playerId = GetPlayerServerId(PlayerId())
    local currentTime = GetGameTimer()
    
    if cooldowns[playerId] and (currentTime - cooldowns[playerId]) < (Config.DoCommand.cooldown * 1000) then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You must wait before using this command again.'}
        })
        return
    end
    
    if #args < 1 then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'Usage: /do [action]'
        })
        return
    end
    
    local action = table.concat(args, ' ')
    TriggerServerEvent('roleplayCommands:do', action)
    cooldowns[playerId] = currentTime
end, false)

RegisterCommand('me', function(source, args, rawCommand)
    if not Config.MeCommand.enabled then return end
    
    local playerId = GetPlayerServerId(PlayerId())
    local currentTime = GetGameTimer()
    
    if cooldowns[playerId] and (currentTime - cooldowns[playerId]) < (Config.MeCommand.cooldown * 1000) then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You must wait before using this command again.'}
        })
        return
    end
    
    if #args < 1 then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'Usage: /me [action]'
        })
        return
    end
    
    local action = table.concat(args, ' ')
    TriggerServerEvent('roleplayCommands:me', action)
    cooldowns[playerId] = currentTime
end, false)