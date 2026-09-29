local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cooldowns = {}

RegisterServerEvent('roleplayCommands:do')
AddEventHandler('roleplayCommands:do', function(action)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    if not Config.DoCommand.enabled then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'This command is disabled.'}
        })
        return
    end
    
    if not IsPlayerAceAllowed(source, Config.DoCommand.permission) then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You do not have permission to use this command.'}
        })
        return
    end
    
    local currentTime = os.time()
    
    if cooldowns[source] and (currentTime - cooldowns[source]) < Config.DoCommand.cooldown then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You must wait before using this command again.'}
        })
        return
    end
    
    local playerName = GetPlayerName(source)
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 255, 0},
        multiline = true,
        args = {'Roleplay', '^*' .. playerName .. ' ' .. action}
    })
    
    cooldowns[source] = currentTime
    
    MySQL.Async.execute('INSERT INTO roleplay_commands (command, player_id) VALUES (@command, @player_id)', {
        ['@command'] = 'do',
        ['@player_id'] = xPlayer.identifier
    })
end)

RegisterServerEvent('roleplayCommands:me')
AddEventHandler('roleplayCommands:me', function(action)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    if not Config.MeCommand.enabled then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'This command is disabled.'}
        })
        return
    end
    
    if not IsPlayerAceAllowed(source, Config.MeCommand.permission) then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You do not have permission to use this command.'}
        })
        return
    end
    
    local currentTime = os.time()
    
    if cooldowns[source] and (currentTime - cooldowns[source]) < Config.MeCommand.cooldown then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You must wait before using this command again.'}
        })
        return
    end
    
    local playerName = GetPlayerName(source)
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 255, 0},
        multiline = true,
        args = {'Roleplay', '^*' .. playerName .. ' ' .. action}
    })
    
    cooldowns[source] = currentTime
    
    MySQL.Async.execute('INSERT INTO roleplay_commands (command, player_id) VALUES (@command, @player_id)', {
        ['@command'] = 'me',
        ['@player_id'] = xPlayer.identifier
    })
end)

RegisterCommand('try', function(source, args, rawCommand)
    if not Config.TryCommand.enabled then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'This command is disabled.'}
        })
        return
    end
    
    if not IsPlayerAceAllowed(source, Config.TryCommand.permission) then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You do not have permission to use this command.'}
        })
        return
    end
    
    local currentTime = os.time()
    
    if cooldowns[source] and (currentTime - cooldowns[source]) < Config.TryCommand.cooldown then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You must wait before using this command again.'}
        })
        return
    end
    
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    local success = math.random(1, 2) == 1
    local result = success and 'succeeded' or 'failed'
    
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 255, 0},
        multiline = true,
        args = {'Roleplay', '^*' .. GetPlayerName(source) .. ' attempted to ' .. table.concat(args, ' ') .. ' and ' .. result}
    })
    
    cooldowns[source] = currentTime
    
    MySQL.Async.execute('INSERT INTO roleplay_commands (command, player_id) VALUES (@command, @player_id)', {
        ['@command'] = 'try',
        ['@player_id'] = xPlayer.identifier
    })
end, false)