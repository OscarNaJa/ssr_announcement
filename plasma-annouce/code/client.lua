
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config['EventRoute']['getSharedObject'], function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('sn_annouce:AutoAnnouce')
AddEventHandler('sn_annouce:AutoAnnouce', function(messageID)
	SendNUIMessage({
		type = 'annouce',
		style = Config['AutoAnnouce'].style,
		title = Config['AutoAnnouce'].title,
		msg = Config['AutoAnnouce'].list[messageID],
		duration = Config['AutoAnnouce'].duration,
	})
end)

RegisterNetEvent('sn_annouce:AdminAnnouce')
AddEventHandler('sn_annouce:AdminAnnouce', function(message)
	SendNUIMessage({
		type = 'annouce',
		style = Config['AdminAnnouce'].style,
		title = Config['AdminAnnouce'].title,
		msg = message,
		duration = Config['AdminAnnouce'].duration,
	})
end)
