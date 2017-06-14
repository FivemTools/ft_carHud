  -- @Date:   2017-06-14T10:45:51+02:00
  -- @Project: FiveM Tools
-- @Last modified time: 2017-06-14T16:25:16+02:00
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
  		  local pasInSeat = GetPedInVehicleSeat(vehicle, -1)

  		  if player == pasInSeat then

          local carSpeed = GetEntitySpeed(vehicle) * speedMultiplicator
  				DrawRect(0.133, 0.947, 0.046, 0.03, 0, 0, 0, 100)
  				exports.ft_ui:Text("~w~" .. math.floor(carSpeed), 4, 0, 0.11, 0.925, 0.64, 255, 255, 255, 255)
  				exports.ft_ui:Text("~w~ " .. text, 4, 0, 0.133, 0.937, 0.4, 255, 255, 255, 255)

  		    end

  		end

  	end

  end)
