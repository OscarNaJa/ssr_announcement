local ESX

CreateThread(function()
	while not ESX do
		TriggerEvent(Config.EventRoute.getSharedObject, function(obj)
			ESX = obj
		end)
		Wait(0)
	end
end)

local function buildPayload(settings, message)
	return {
		type = 'announce',
		style = settings.style,
		title = settings.title,
		msg = message,
		duration = settings.duration,
		logo = settings.logo,
		sound = settings.sound,
	}
end

RegisterNetEvent('ssr_announce:auto', function(messageId)
	local settings = Config.AutoAnnouce
	if not settings or not settings.enable then
		return
	end

	local message = settings.list and settings.list[messageId]
	if not message then
		return
	end

	SendNUIMessage(buildPayload(settings, message))
end)

RegisterNetEvent('ssr_announce:admin', function(message)
	local settings = Config.AdminAnnouce
	if not settings or not settings.enable then
		return
	end

	SendNUIMessage(buildPayload(settings, message))
end)

-- Backward compatibility
RegisterNetEvent('sn_annouce:AutoAnnouce', function(messageId)
	TriggerEvent('ssr_announce:auto', messageId)
end)

RegisterNetEvent('sn_annouce:AdminAnnouce', function(message)
	TriggerEvent('ssr_announce:admin', message)
end)
