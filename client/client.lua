ESX = nil

local hasCinematic = false

Citizen.CreateThread(function()
  while ESX == nil do
	ESX = exports["es_extended"]:getSharedObject()
	player = ESX.GetPlayerData()
  end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(20)

		local playerPed = PlayerPedId()

		if IsControlJustPressed(0, 311) then
			hasCinematic = not hasCinematic
			if hasCinematic == true then
				SendNUIMessage({openCinema = true})
				DisplayRadar(false)
				--ESX.UI.HUD.SetDisplay(0.0)								-- Stop de ESX standard interface
				--TriggerEvent('es:setMoneyDisplay', 0.0)					-- Hide ESX info
				--TriggerEvent('esx_status:setDisplay', 0.0)				-- Hide ESX info
				
				-- If you use an exotic HUD (like m-hud) you can simply stop/start the resource (depends how many players you had).
				-- Better is to find in your exotic HUD the way to hide of course
				--ExecuteCommand("stop m-hud")
				--ExecuteCommand("stop m-minimap")
				
			else
				SendNUIMessage({openCinema = false})
				DisplayRadar(true)
				--ESX.UI.HUD.SetDisplay(1.0)
				--TriggerEvent('es:setMoneyDisplay', 1.0)
				--TriggerEvent('esx_status:setDisplay', 1.0)
				--ExecuteCommand("start m-hud")
				--ExecuteCommand("start m-minimap")
				
			end
		end

	end
end)
