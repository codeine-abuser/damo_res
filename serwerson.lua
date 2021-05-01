ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent("damo:wyjebCwela")
AddEventHandler("damo:wyjebCwela", function()
	DropPlayer(source, 'Zmień rozdzielczość na 16:9! Nie tolerujemy E-Sportowców')
end)

ESX.RegisterServerCallback('damo:perms', function(source, cb)
	niger = GetPlayerIdentifiers(source)[1]
	niger = niger:gsub("steam:", "")
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = niger
    })
    local hexBypass = result[1].hexbypass
    if hexBypass == 'true' then
        cb(true)
    else
        cb(false)
    end
end)