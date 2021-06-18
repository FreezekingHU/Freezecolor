local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterCommand("color", function(source, args, rawCommand)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    local r = tonumber(args[1])
    local g = tonumber(args[2])
    local b = tonumber(args[3])
        
    ESX.TriggerServerCallback("freezecolor:checkrank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" then
            SetVehicleCustomPrimaryColour(vehicle, r,g,b)
        else
            ESX.ShowNotification("~r~You must be an admin to use this command!")
        end
    end)
end)

RegisterCommand("color2", function(source, args, rawCommand)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    local r = tonumber(args[1])
    local g = tonumber(args[2])
    local b = tonumber(args[3])
        
    ESX.TriggerServerCallback("freezecolor:checkrank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" then
            SetVehicleCustomSecondaryColour(vehicle, r,g,b)
        else
            ESX.ShowNotification("~r~You must be an admin to use this command!")
        end
    end)
end)