ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

serverSettings = serverSettings or { debug = false }

Citizen.CreateThread(function()
    while true do
        if Config['AutoAnnouce'] and Config['AutoAnnouce'].list and #Config['AutoAnnouce'].list > 0 then
            local messageID = math.random(1, #Config['AutoAnnouce'].list)
            TriggerClientEvent('sn_annouce:AutoAnnouce', -1, messageID)
            if serverSettings.debug then
            end
        end
        Citizen.Wait(Config['AutoAnnouce'].interval or 300000)
    end
end)

RegisterCommand('anm', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.getGroup() == 'admin' then
        local message = table.concat(args, ' ')
        if message and message ~= '' then
            TriggerClientEvent('sn_annouce:AdminAnnouce', -1, message)
            if serverSettings.debug then
            end
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {'[ERROR]', 'Please provide a message for the announcement.'}
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'[ERROR]', 'You do not have permission to use this command.'}
        })
    end
end, false)

RegisterServerEvent('sn_annouce:AdminAnnouce')
AddEventHandler('sn_annouce:AdminAnnouce', function(message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.getGroup() == 'admin' then
        if message and message ~= '' then
            TriggerClientEvent('sn_annouce:AdminAnnouce', -1, message)
            if serverSettings.debug then
            end
        end
    end
end)