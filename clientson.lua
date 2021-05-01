ESX                           = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100000)
	end
end)

CreateThread(function()	
	while true do
		Citizen.Wait(5000)
        local esportowiec = GetIsWidescreen()
        if not esportowiec and not koks then
            ESX.TriggerServerCallback('damo:perms', function(hexBypass)
                print(hexBypass)
                if not hexBypass then
                    dowyjebaniazostalo()
                    koks = true
                end
            end)
        elseif esportowiec and koks then
            koks = false
        end
	end
end)

function dowyjebaniazostalo()
	local dowyjebaniazostalo = 60
	CreateThread(function()
		while dowyjebaniazostalo > 0 and koks do
			Citizen.Wait(1000)

			if dowyjebaniazostalo > 0 then
                dowyjebaniazostalo = dowyjebaniazostalo - 1
                if dowyjebaniazostalo == 0 then
                    TriggerServerEvent("damo:wyjebCwela")
                end
			end
		end
	end)
	CreateThread(function()
		while true do
			Citizen.Wait(2000)
            if koks then
                ESX.ShowNotification('Zostało Ci 60s na zmienienie rozdziałki na 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Zostało Ci 50s na zmienienie rozdziałki na 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Zostało Ci 40s na zmienienie rozdziałki na 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Zostało Ci 30s na zmienienie rozdziałki na 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Zostało Ci 20s na zmienienie rozdziałki na 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Zostało Ci 10s na zmienienie rozdziałki na 16:9')
                Citizen.Wait(10000)
            else
                SetScaleformMovieAsNoLongerNeeded(scaleform)
            end
		end
	end)
end