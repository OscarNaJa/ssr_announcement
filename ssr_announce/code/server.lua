local ESX
TriggerEvent(Config.EventRoute.getSharedObject, function(obj)
	ESX = obj
end)

local function hasPermission(xPlayer)
	if not xPlayer then
		return false
	end

	local groups = Config.AdminAnnouce and Config.AdminAnnouce.group or {}
	local playerGroup = xPlayer.getGroup()

	for _, group in ipairs(groups) do
		if playerGroup == group then
			return true
		end
	end

	return false
end

CreateThread(function()
	while true do
		local settings = Config.AutoAnnouce
		if settings and settings.enable and settings.list and #settings.list > 0 then
			local messageId = math.random(1, #settings.list)
			TriggerClientEvent('ssr_announce:auto', -1, messageId)
		end

		local timeoutMinutes = (settings and settings.timeout) or 5
		Wait(timeoutMinutes * 60000)
	end
end)

local function pushAdminAnnouncement(source, message)
	if not message or message == '' then
		TriggerClientEvent('chat:addMessage', source, {
			color = { 255, 0, 0 },
			multiline = true,
			args = { '[ERROR]', 'Please provide a message for the announcement.' },
		})
		return
	end

	TriggerClientEvent('ssr_announce:admin', -1, message)
end

RegisterCommand(Config.AdminAnnouce.command, function(source, args)
	local settings = Config.AdminAnnouce
	if not settings or not settings.enable then
		return
	end

	local xPlayer = ESX.GetPlayerFromId(source)
	if not hasPermission(xPlayer) then
		TriggerClientEvent('chat:addMessage', source, {
			color = { 255, 0, 0 },
			multiline = true,
			args = { '[ERROR]', 'You do not have permission to use this command.' },
		})
		return
	end

	pushAdminAnnouncement(source, table.concat(args, ' '))
end, false)

RegisterNetEvent('ssr_announce:admin', function(message)
	local sourceId = source
	local settings = Config.AdminAnnouce
	if not settings or not settings.enable then
		return
	end

	local xPlayer = ESX.GetPlayerFromId(sourceId)
	if hasPermission(xPlayer) then
		pushAdminAnnouncement(sourceId, message)
	end
end)

-- Backward compatibility
RegisterNetEvent('sn_annouce:AdminAnnouce', function(message)
	TriggerEvent('ssr_announce:admin', message)
end)
