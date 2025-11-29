--[[CONFIG]]
local deleteTimer = 60 -- time in minutes

-----------------------------------------
--[[Core]]
CreateThread(function()
    while true do
        Wait(deleteTimer * 60000) -- Wait for configured time

        -- Notify players 1 minute before towing
        TriggerClientEvent('ox_lib:notify', -1, {
            title = "Vehicle Cleanup",
            description = "Inactive vehicles will be towed in 1 MIN",
            type = "warning",
            position = "top",
            duration = 7000 -- 7 seconds
        })
        Wait(45000) -- 45 seconds

        -- Notify players 15 seconds before towing
        TriggerClientEvent('ox_lib:notify', -1, {
            title = "Vehicle Cleanup",
            description = "Inactive vehicles will be towed in 15 SECS",
            type = "warning",
            position = "top",
            duration = 5000 -- 5 seconds
        })
        Wait(10000) -- 10 seconds

        -- Notify players 5 seconds before towing
        TriggerClientEvent('ox_lib:notify', -1, {
            title = "Vehicle Cleanup",
            description = "Inactive vehicles will be towed in 5 SECS",
            type = "warning",
            position = "top",
            duration = 4000 -- 4 seconds
        })
        Wait(5000) -- 5 seconds

        -- Tow inactive vehicles (here using DeleteEntity as placeholder; replace with actual tow logic if needed)
        for i, veh in pairs(GetAllVehicles()) do
            if HasVehicleBeenOwnedByPlayer(veh) then
                if not isVehicleOccupied(veh) then
                    DeleteEntity(veh) -- replace with tow logic if desired
                end
            end
        end

        -- Notify players that vehicles have been towed
        TriggerClientEvent('ox_lib:notify', -1, {
            title = "Vehicle Cleanup",
            description = "All inactive vehicles have been towed",
            type = "success",
            position = "top",
            duration = 8000 -- 8 seconds
        })
    end
end)

--[[Check if a vehicle is occupied]]
function isVehicleOccupied(veh)
    for seat = -1, 6 do -- All seats
        if GetPedInVehicleSeat(veh, seat) ~= 0 then
            return true -- Vehicle is occupied
        end
    end
    return false -- Vehicle is empty
end
