  -- @Project: FiveM Tools
  -- @License: GNU General Public License v3.0

Citizen.CreateThread(function()

	local text = "KM/H"
	local speedMultiplicator = 3.6

	if not Config.kmhMode then
		speedMultiplicator = 2.236936
		text = "MPH"
	end

	while true do
		Citizen.Wait(1)
		local player = GetPlayerPed(-1) -- current ped

		if IsPedInAnyVehicle(player, false) then
      local vehicle = GetVehiclePedIsIn(player, false) -- Current Vehicle ped is in
		  local pasInSeat = GetPedInVehicleSeat(vehicle, -1) -- Driver Seat

		  if player == pasInSeat then

        if Config.Advanced_for_plane == true and (GetVehicleClass(vehicle) == 15 or GetVehicleClass(vehicle) == 16) then

          local carSpeed = GetEntitySpeedVector(vehicle).z * speedMultiplicator -- convert in km/h or mph
  				DrawRect(0.125, 0.835, 0.06, 0.07, 0, 0, 0, Config.Rect_alpha)
  				exports.ft_libs:Text({ text = "~w~V : " .. math.floor(carSpeed), font = 4, x = 0.095, y = 0.795, scale = 0.64, alpha = Config.Speed_alpha})
  				exports.ft_libs:Text({ text = "~w~ " .. text, font = 4, x = 0.133, y = 0.805, scale = 0.4, alpha = Config.Speed_alpha})

          local carSpeed = (GetEntitySpeed(vehicle) * speedMultiplicator) - (math.sqrt(carSpeed*carSpeed))
          exports.ft_libs:Text({ text = "~w~H : " .. math.floor(carSpeed), font = 4, x = 0.095, y = 0.83, scale = 0.64, alpha = Config.Speed_alpha})
  				exports.ft_libs:Text({ text = "~w~ " .. text, font = 4, x = 0.133, y = 0.84, scale = 0.4, alpha = Config.Speed_alpha})

        else
          local carSpeed = GetEntitySpeed(vehicle) * speedMultiplicator -- convert in km/h or mph
  				DrawRect(0.133, 0.947, 0.046, 0.03, 0, 0, 0, Config.Rect_alpha)
  				exports.ft_libs:Text({ text = "~w~" .. math.floor(carSpeed), font = 4, x = 0.11, y = 0.925, scale = 0.64, alpha = Config.Speed_alpha})
  				exports.ft_libs:Text({ text = "~w~ " .. text, font = 4, x = 0.133, y = 0.937, scale = 0.4, alpha = Config.Speed_alpha})
        end

		  end
		end
	end
end)
