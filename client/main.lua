RegisterCommand("staffmenu", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "admin_menu",
                title = "Shotaro Staff Menu",
                options = {
                    ["🧍‍♂️ Online Players"] = {event = "sho_adminmenu:OnlinePlayers", description = "Show Online Players"},
                    ["🧍‍♂️ Player Related Options"] = {event = "sho_adminmenu:PlayerRelatedOptionsMenu", description = "Show Player Related Options"},
                    ["🚙 Vehicle Related Options"] = {event = "sho_adminmenu:VehiclesRelatedOptionsMenu", description = "Show Vehicle Related Options"},
                    ["🚧 Misc Settings"] = {event = "sho_adminmenu:MiscOptions", description = "Misc Settings"},
                    ["🚧 Troll Menu"] = {event = "sho_adminmenu:TrollMenu", description = "Open Troll Menu"},
                    ["📸 Rockstar Editor"] = {event = "sho_adminmenu:RockstarSettings", description = "Rockstar Settings"}
                }
            })
            lib.showContext("admin_menu")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OpenAdminmenu")
end)

RegisterKeyMapping("staffmenu", "Shotaro Staff Menu", "keyboard", "f11")

RegisterNetEvent("sho_adminmenu:OnlinePlayers", function()
    lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
        local myMenu = {}
        for k, v in pairs(plyList) do
            myMenu[v.name] = {
                description = v.name.." ID: "..v.source,
                arrow = true,
                event = "sho_adminmenu:OpenPlayersMenu",
                args = {id = v.source, name = v.name}
            }
        end
        lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "admin_menu", options = myMenu})
        lib.showContext("online_players")
    end)
end)

RegisterNetEvent("sho_adminmenu:OpenPlayersMenu", function(data)
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            selectedPlayer = data.id
            lib.registerContext({
                id = "online_players_each",
                title = "ID: "..selectedPlayer.."",
                menu = "online_players",
                options = {
                    ["💬 Send Private Message"] = {event = "sho_adminmenu:client:SendMessage", description = "Send private message to player"},
                    ["💬 Change Skin"] = {event = "sho_adminmenu:client:ChangeSkin", description = "Change skin option for player"},
                    ["📂 Show Inventory"] = {event = "sho_adminmenu:client:ShowInventory", description = "Show Player Inventory"},
                    ["📗 Set Job"] = {event = "sho_adminmenu:client:GetJobs", description = "Change Player Job"},
                    ["🎁 Give Player Item"] = {event = "sho_adminmenu:client:GiveItem", description = "Give Item"},
                    ["🗑 Remove Inventory Item"] = {event = "sho_adminmenu:client:GetItems", description = "Remove Item"},
                    ["💵 Give Account Money"] = {event = "sho_adminmenu:client:GiveAccountMoney", description = "Give Money"},
                    ["💵 Remove Account Money"] = {event = "sho_adminmenu:client:RemoveAccountMoney", description = "Remove Money"},
                    ["✨ Add / Remove License"] = {event = "sho_adminmenu:client:ToggleLicense", description = "Add / Remove License"},
                    ["✨ Heal Player"] = {event = "sho_adminmenu:client:HealPlayer", description = "Heal Player"},
                    ["❤️ Revive Player"] = {event = "sho_adminmenu:client:RevivePlayer", description = "Revive Player"},
                    ["🛸 Teleport To Player"] = {event = "sho_adminmenu:client:Goto", description = "Teleport To Player"},
                    ["🚀 Bring Player"] = {event = "sho_adminmenu:client:Bring", description = "Bring Player"},
                    ["💾 Print Identifiers"] = {event = "sho_adminmenu:client:PrintID", description = "Print player identifiers"},
                    ["🔪 Kill Player"] = {event = "sho_adminmenu:client:KillPlayer", description = "Kill Player"},
                    ["🦶🏽 Kick Player"] = {event = "sho_adminmenu:client:KickPlayer", description = "Kick Player"},
                    ["📷 Screenshot"] = {event = "sho_adminmenu:client:ScreenShopPlayer", description = "Take screenshot of player screen"},
                    ["🔬 Spectate Player"] = {event = "sho_adminmenu:client:SpectatePlayer", description = "Spectate Player"}
                }
            })
            lib.showContext("online_players_each")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions")
end)

RegisterNetEvent("sho_adminmenu:client:SendMessage", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu", {"Message"})
            if input then
                local message = input[1]
                if message == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Message", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:SendMessage", selectedPlayer, message)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_SendMessage")
end)

RegisterNetEvent("sho_adminmenu:client:ChangeSkin", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:ChangeSkin", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_ChangeSkin")
end)

RegisterNetEvent("sho_adminmenu:client:ShowInventory", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:ShowInventory", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_OpenInventory")
end)

RegisterNetEvent("sho_adminmenu:client:GetJobs", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            ESX.TriggerServerCallback("sho_adminmenu:server:GetJobs", function(jobs)
                local myMenu = {}
                for k, v in pairs(jobs) do
                    local grade = 0
                    for i, j in pairs(v.grades) do
                        grade = grade + 1
                    end
                    myMenu[v.label .. " - " .. v.name] = {
                        description = "Grades = " .. grade - 1,
                        arrow = true,
                        event = "sho_adminmenu:client:setgrade",
                        args = {job = v.name, max = grade}
                    }
                end
                lib.registerContext({id = "GetJobs", title = "📗 All Jobs", menu = "online_players_each", options = myMenu})
                lib.showContext("GetJobs")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_SetJob")
end)

RegisterNetEvent("sho_adminmenu:client:setgrade", function(data)
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local job = data.job
            local max = tonumber(data.max) - 1
            local input = lib.inputDialog("Staff Menu", {"Max Grade: " .. max})
            if input then
                local grade = tonumber(input[1])
                if grade == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Grade", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:SetJob", selectedPlayer, job, grade)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_SetJob")
end)

RegisterNetEvent("sho_adminmenu:GiveItem", function(data)
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local player = data.plyid
            local item = data.item
            local input = lib.inputDialog("Staff Menu Give Item", {"Amount:"})
            if input then
                local count = tonumber(input[1])
                if count == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Amount", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:GiveItem", player, item, count)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_GiveItem")
end)

RegisterNetEvent("sho_adminmenu:client:GiveItem", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local Items = exports.ox_inventory:Items()
            local myMenu = {}
            for k, v in pairs(Items) do
                myMenu[v.label] = {
                    description = "Give " .. v.name,
                    arrow = true,
                    event = "sho_adminmenu:GiveItem",
                    args = {item = v.name, plyid = selectedPlayer}
                }
            end
            lib.registerContext({id = "GetItems", title = "🎁 All Items", menu = "online_players_each", options = myMenu})
            lib.showContext("GetItems")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_GiveItem")
end)

RegisterNetEvent("sho_adminmenu:client:GetItems", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:GetItems", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_RemoveInventoryItem")
end)

RegisterNetEvent("sho_adminmenu:client:RemoveItemCount", function(data)
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local pid = data.plyid
            local item = data.item
            local input = lib.inputDialog("Staff Menu Remove Item: " .. item, {"Count:"})
            if input then
                local count = tonumber(input[1])
                if count == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Amount", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:RemoveItem", pid, item, count)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_RemoveInventoryItem")
end)

RegisterNetEvent("sho_adminmenu:client:RemoveItem", function(ply, list)
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local pid = ply
            local items = list
            local myMenu = {}
            for k, v in pairs(items) do
                myMenu[v.label] = {
                    description = "Remove " .. v.name,
                    arrow = true,
                    event = "sho_adminmenu:client:RemoveItemCount",
                    args = {item = v.name, plyid = pid}
                }
            end
            lib.registerContext({id = "RemoveItems", title = "🎁 Remove Inventory Items", menu = "online_players_each", options = myMenu})
            lib.showContext("RemoveItems")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_RemoveInventoryItem")
end)

RegisterNetEvent("sho_adminmenu:client:GiveAccountMoney", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Give Account Money - TSADMIN", {"Account Name (money, bank, black_money)", "Amount"})
            if input then
                local account = input[1]
                local money = tonumber(input[2])
                if account == nil or money == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Account or Amount", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:GiveAccMoney", selectedPlayer, account, money)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_GiveMoney")
end)

RegisterNetEvent("sho_adminmenu:client:RemoveAccountMoney", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Remove Account Money - TSADMIN", {"Account Name (money, bank, black_money)", "Amount"})
            if input then
                local account = input[1]
                local money = tonumber(input[2])
                if account == nil or money == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Account Or Amount", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:RemoveAccMoney", selectedPlayer, account, money)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_RemoveMoney")
end)

RegisterNetEvent("sho_adminmenu:client:ToggleLicense", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu - License Manager", {"License Name"})
            if input then
                local license = input[1]
                if license == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Name", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:ToggleLicense", selectedPlayer, license)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_License")
end)

RegisterNetEvent("sho_adminmenu:client:HealPlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:HealPlayer", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_Heal")
end)

RegisterNetEvent("sho_adminmenu:client:RevivePlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:RevivePlayer", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_Revive")
end)

RegisterNetEvent("sho_adminmenu:client:Goto", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:Goto", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_Goto")
end)

RegisterNetEvent("sho_adminmenu:client:Bring", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:Bring", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_Bring")
end)

RegisterNetEvent("sho_adminmenu:client:PrintID", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:PrintID", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_PRINTID")
end)

RegisterNetEvent("sho_adminmenu:PrintID", function(steamid, license, xbl, ip, discord, liveid)
    print(steamid, license, xbl, ip, discord, liveid)
end)

RegisterNetEvent("sho_adminmenu:client:KillPlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:KillPlayer", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_KillPlayer")
end)

RegisterNetEvent("sho_adminmenu:client:Kill", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            SetEntityHealth(PlayerPedId(), 0)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_KillPlayer")
end)

RegisterNetEvent("sho_adminmenu:client:KickPlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:KickPlayer", selectedPlayer)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_KickPlayer")
end)

RegisterNetEvent("sho_adminmenu:client:ScreenShopPlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            exports["screenshot-basic"]:requestScreenshotUpload("https://discord.com/api/webhooks/974002549835333702/qasfRoc_k4xPXHSJDOPZNl20FKbon_hRayZhyRD-CgGdzOAng-MXx631sKwFkQyiAB-f", "files[]", function(data) end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_ScreenShopPlayer")
end)

RegisterNetEvent("sho_adminmenu:client:SpectatePlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetSpectateData", false, function(data)
                local ped = PlayerPedId()
                local specinterval = nil
                local controlInterval = nil
                local targetPly = nil
                local targetPed = nil
                if not spectating then
                    lastPos = GetEntityCoords(ped)
                    spectating = true
                    DoScreenFadeOut(500)
                    Wait(500)
                    RequestCollisionAtCoord(data)
                    SetEntityVisible(ped, false)
                    SetEntityCoords(ped, data + vector3(0, 0, 10))
                    FreezeEntityPosition(ped, true)
                    Wait(1500)
                    SetEntityCoords(ped, data - vector3(0, 0, 10))
                    targetPly = GetPlayerFromServerId(selectedPlayer)
                    targetPed = GetPlayerPed(targetPly)
                    DoScreenFadeIn(500)
                    NetworkSetInSpectatorMode(true, targetPed)
                    specinterval = SetInterval(function()
                        local god = tostring(GetPlayerInvincible(targetPly))
                        local ragdoll = tostring(not CanPedRagdoll(targetPed))
                        local health = tostring(GetEntityHealth(targetPed))
                        local armor = tostring(GetPedArmour(targetPed))
                        if god == "1" then
                            god = "true"
                        end
                        local msg = "Godmode: " .. god .. "  \nAntiRagdoll: " .. ragdoll .. "  \nHealth: " .. health .. "  \nArmor: " .. armor
                        if spectating then
                        showPlyInfo(tostring(msg))
                        end
                    end, 2000)
                    controlInterval = SetInterval(function()
                        DisableControlAction(0, 38, true)
                        if IsDisabledControlJustPressed(0, 38) and spectating then
                            spectating = false
                            ClearInterval(specinterval)
                            ClearInterval(controlInterval)
                            controlInterval = nil
                            specinterval = nil
                            targetPly = nil
                            targetPed = nil
                            RequestCollisionAtCoord(lastPos)
                            NetworkSetInSpectatorMode(false, ped)
                            SetEntityCoords(ped, lastPos)
                            SetEntityVisible(ped, true)
                            FreezeEntityPosition(ped, false)
                            lib.hideTextUI()
                        end
                    end, 0)
                else
                    spectating = false
                    ClearInterval(specinterval)
                    ClearInterval(controlInterval)
                    controlInterval = nil
                    specinterval = nil
                    targetPly = nil
                    targetPed = nil
                    RequestCollisionAtCoord(lastPos)
                    FreezeEntityPosition(ped, false)
                    SetEntityCoords(ped, lastPos)
                    SetEntityVisible(ped, true)
                    FreezeEntityPosition(ped, false)
                    lib.hideTextUI()
                end
            end, selectedPlayer)
            showPlyInfo = function(data)
                lib.showTextUI(data, {position = "top-center"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "OnlinePlyOptions_SpectatePlayer")
end)

RegisterNetEvent("sho_adminmenu:VehiclesRelatedOptionsMenu", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "vehicle_related_options",
                title = "🚙 Vehicle Related Options",
                menu = "admin_menu",
                options = {
                    ["🚙 Delete Vehicle Radius"] = {event = "sho_adminmenu:client:DeleteVehicle", description = "Delete vehicles in radius"},
                    ["🚙 Unlock Vehicle"] = {event = "sho_adminmenu:client:UnlockVehicle", description = "Unlock Closest Vehicle"},
                    ["🚙 Spawn Custom Vehicle"] = {event = "sho_adminmenu:client:SpawnCustomVehicle", description = "Spawn Custom Veh"},
                    ["🚙 Vehicle Options"] = {event = "sho_adminmenu:client:VehicleOptions", description = "Vehicle Options"}
                }
            })
            lib.showContext("vehicle_related_options")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions")
end)

RegisterNetEvent("sho_adminmenu:client:DeleteVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu", {"Radius"})
            if input then
                local radius = input[1]
                if radius == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Radius", type = "error"})
                end
                TriggerServerEvent("sho_adminmenu:server:DeleteVehicle", radius)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_DeleteVehicle")
end)

RegisterNetEvent("sho_adminmenu:client:UnlockVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local vehicle = ESX.Game.GetClosestVehicle()
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_UnlockVehicle")
end)

RegisterNetEvent("sho_adminmenu:client:SpawnCustomVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu", {"Vehicle Code"})
            if input then
                local vehiclename = input[1]
                if vehiclename == nil then
                    return TriggerServerEvent("sho_adminmenu:server:SpawnVehicle", "baller2")
                end
                TriggerServerEvent("sho_adminmenu:server:SpawnVehicle", vehiclename)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_SpawnCustomVehicle")
end)

RegisterNetEvent("sho_adminmenu:client:VehicleOptions", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "vehicle_options",
                title = "🚙 Vehicle Options",
                menu = "vehicle_related_options",
                options = {
                    ["🧊 Freeze Vehicle"] = {event = "sho_adminmenu:toggle_FreezeVehicle", description = "Freeze Vehicle"},
                    ["🚧 Toggle Engine"] = {event = "sho_adminmenu:toggle_Engine", description = "Toggle Engine"},
                    ["⌨️ Change Numberplate"] = {event = "sho_adminmenu:ChangeNumberPlate", description = "Change Number Plate Text"},
                    ["🚗 Flip Vehicle"] = {event = "sho_adminmenu:FlipVehicle", description = "Set Vehicle Properly"},
                    ["🚗 Delete Vehicle"] = {event = "sho_adminmenu:DeleteVehiclePlayer", description = "Delete Vehicle you are in"},
                    ["💪 Vehicle Godmode"] = {event = "sho_adminmenu:VehicleGodMode", description = "Vehicle Godmode"},
                    ["🛠 Repair Vehicle"] = {event = "sho_adminmenu:RepairVehicle", description = "Repair Vehicle"},
                    ["🚿 Wash Vehicle"] = {event = "sho_adminmenu:WashVehicle", description = "Wash Vehicle"},
                    ["🚿 Keep Vehicle Clean"] = {event = "sho_adminmenu:KeepVehicleClean", description = "Keep Vehicle Clean"}
                }
            })
            lib.showContext("vehicle_options")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_VehicleOptions")
end)

local FreezeVehicle = false

RegisterNetEvent("sho_adminmenu:toggle_FreezeVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if FreezeVehicle then
                FreezeVehicle = false
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                FreezeEntityPosition(veh, false)
                lib.notify({title = "Staff Menu", description = "Vehicle UnFreeze", type = "inform"})
            else
                FreezeVehicle = true
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                FreezeEntityPosition(veh, true)
                lib.notify({title = "Staff Menu", description = "Vehicle Freeze", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_FreezeVehicle")
end)

local Engine = false

RegisterNetEvent("sho_adminmenu:toggle_Engine", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if Engine then
                Engine = false
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                SetVehicleEngineOn(veh, false, true, true)
                lib.notify({title = "Staff Menu", description = "Engine Off", type = "inform"})
            else
                Engine = true
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                SetVehicleEngineOn(veh, true, true, true)
                lib.notify({title = "Staff Menu", description = "Engine On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_Engine")
end)

RegisterNetEvent("sho_adminmenu:ChangeNumberPlate", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu", {"Number Plate Text"})
            if input then
                local platenumber = input[1]
                if platenumber == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Plate", type = "error"})
                end
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                if veh ~= 0 then
                    SetVehicleNumberPlateText(veh, platenumber)
                end
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_ChangeNumberPlate")
end)

RegisterNetEvent("sho_adminmenu:FlipVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, true)
            local veh2 = GetVehiclePedIsIn(ped, false)
            SetVehicleOnGroundProperly(veh or veh2)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_FlipVehicle")
end)

RegisterNetEvent("sho_adminmenu:DeleteVehiclePlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            TriggerServerEvent("sho_adminmenu:server:DeleteVehicle")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_DeleteVehiclePlayer")
end)

local VehicleGodMode = false
local vehgod = nil

RegisterNetEvent("sho_adminmenu:VehicleGodMode", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if VehicleGodMode then
                VehicleGodMode = false
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                SetEntityInvincible(veh, false)
                SetVehicleEngineCanDegrade(veh, true)
                SetVehicleCanBeVisiblyDamaged(veh, true)
                SetVehicleWheelsCanBreak(veh, true)
                SetVehicleHasStrongAxles(veh, false)
                SetVehicleTyresCanBurst(veh, true)
                SetDisableVehicleEngineFires(veh, false)
                ClearInterval(vehgod)
                lib.notify({title = "Staff Menu", description = "Vehicle GodMode Off", type = "inform"})
            else
                VehicleGodMode = true
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                SetEntityInvincible(veh, true)
                SetVehicleEngineCanDegrade(veh, false)
                SetVehicleCanBeVisiblyDamaged(veh, false)
                SetVehicleWheelsCanBreak(veh, false)
                SetVehicleHasStrongAxles(veh, true)
                SetVehicleTyresCanBurst(veh, false)
                SetDisableVehicleEngineFires(veh, true)
                vehgod = SetInterval(function()
                    if IsVehicleDamaged(veh) then
                        RemoveDecalsFromVehicle(veh)
                        SetVehicleFixed(veh)
                        SetVehicleDeformationFixed(veh)
                    end
                    if IsVehicleEngineOnFire(veh) then
                        SetDisableVehicleEngineFires(veh, true)
                    end
                    if ESX.Math.Round(GetVehicleEngineHealth(veh), 1) < 1000 then
                        SetVehicleFixed(veh)
                        SetVehicleEngineHealth(veh, 4000)
                    end
                end, 0)
                lib.notify({title = "Staff Menu", description = "Vehicle GodMode On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_VehicleGodMode")
end)

RegisterNetEvent("sho_adminmenu:RepairVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= 0 then
                SetVehicleFixed(veh)
                SetVehicleDeformationFixed(veh)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_RepairVehicle")
end)

RegisterNetEvent("sho_adminmenu:WashVehicle", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= 0 then
                SetVehicleDirtLevel(veh, 0.0)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_WashVehicle")
end)

local KeepVehicleClean = false
local keepclean = nil

RegisterNetEvent("sho_adminmenu:KeepVehicleClean", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if KeepVehicleClean then
                KeepVehicleClean = false
                ClearInterval(keepclean)
            else
                KeepVehicleClean = true
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                keepclean = SetInterval(function()
                    if GetVehicleDirtLevel(veh) > 0.0 then
                        SetVehicleDirtLevel(veh, 0.0)
                    end
                end, 0)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "VehicleRelatedOptions_KeepVehicleClean")
end)

RegisterNetEvent("sho_adminmenu:PlayerRelatedOptionsMenu", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "player_related_options",
                title = "🧍‍♂️ Player Related Options",
                menu = "admin_menu",
                options = {
                    ["🧍‍♂️ Player Options"] = {event = "sho_adminmenu:client:PlayerOptions", description = "Player Options"},
                    ["🧍‍♂️ Ped Options"] = {event = "sho_adminmenu:client:PedOptions", description = "Ped Options"}
                }
            })
            lib.showContext("player_related_options")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions")
end)

RegisterNetEvent("sho_adminmenu:client:PlayerOptions", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "player_options",
                title = "🧍‍♂️ Player Options",
                menu = "player_related_options",
                options = {
                    ["💪 Godmode"] = {event = "sho_adminmenu:toggle_GodMode", description = "Godmode"},
                    ["👀 Invisible"] = {event = "sho_adminmenu:toggle_Invisible", description = "Invisible"},
                    ["🏃🏻‍♀️ Unlimited Stamina"] = {event = "sho_adminmenu:toggle_Stamina", description = "Unlimited Stamina"},
                    ["🏊🏻‍♂️ Fast Swim"] = {event = "sho_adminmenu:toggle_FastSwim", description = "Fast Swim"},
                    ["🏃‍♀️ Super Jump"] = {event = "sho_adminmenu:toggle_SuperJump", description = "Super Jump"},
                    ["🏃‍♀️ No Ragdoll"] = {event = "sho_adminmenu:toggle_NoRagDoll", description = "No Ragdoll"},
                    ["💙 Set Armor"] = {event = "sho_adminmenu:SetArmor", description = "Set Armor"},
                    ["🚿 Clean Player Clothes"] = {event = "sho_adminmenu:CleanPlayerClothes", description = "Clean Player Clothes"},
                    ["🧺 Wet Player Clothes"] = {event = "sho_adminmenu:WetPlayerClothes", description = "Wet Player Clothes"},
                    ["🔅 Dry Player Clothes"] = {event = "sho_adminmenu:DryPlayerClothes", description = "Dry Player Clothes"},
                    ["💀 Commit Suicide"] = {event = "sho_adminmenu:CommitSuicide", description = "Commit Suicide"},
                    ["🧊 Freeze Player"] = {event = "sho_adminmenu:FeezePlayer", description = "Freeze Player"},
                    ["🪂 Toggle Noclip"] = {event = "sho_adminmenu:toggle_noclip", description = "Toggle Noclip"}
                }
            })
            lib.showContext("player_options")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_PlayerOptions")
end)

local GodMode = false
local god = nil

RegisterNetEvent("sho_adminmenu:toggle_GodMode", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if GodMode then
                GodMode = false
                SetPedCanRagdoll(PlayerPedId(), true)
                SetPedDiesWhenInjured(PlayerPedId(), true)
                SetPedDiesInstantlyInWater(PlayerPedId(), true)
                SetPedDiesInVehicle(PlayerPedId(), true)
                SetPedDiesInSinkingVehicle(PlayerPedId(), true)
                ClearInterval(god)
                lib.notify({title = "Staff Menu", description = "GodMode Off", type = "inform"})
            else
                GodMode = true
                local ped = PlayerPedId()
                local maxh = GetEntityMaxHealth(ped)
                SetPedCanRagdoll(ped, false)
                SetPedDiesWhenInjured(ped, false)
                SetPedDiesInstantlyInWater(ped, false)
                SetPedDiesInVehicle(ped, false)
                SetPedDiesInSinkingVehicle(ped, false)
                god = SetInterval(function()
                    if CanPedRagdoll(PlayerPedId()) then
                        SetPedCanRagdoll(PlayerPedId(), false)
                    end
                    if GetEntityHealth(ped) < maxh then
                        SetEntityHealth(PlayerPedId(), maxh)
                    end
                end, 0)
                lib.notify({title = "Staff Menu", description = "GodMode On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_GodMode")
end)

local Invisible = false

RegisterNetEvent("sho_adminmenu:toggle_Invisible", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if Invisible then
                Invisible = false
                SetEntityVisible(PlayerPedId(), true, 0)
                SetPedAudioFootstepLoud(PlayerPedId(), true)
                SetPedAudioFootstepQuiet(PlayerPedId(), true)
                lib.notify({title = "Staff Menu", description = "Invisible Off", type = "inform"})
            else
                Invisible = true
                SetEntityVisible(PlayerPedId(), false, 0)
                SetPedAudioFootstepLoud(PlayerPedId(), false)
                SetPedAudioFootstepQuiet(PlayerPedId(), false)
                lib.notify({title = "Staff Menu", description = "Invisible On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_Invisible")
end)

local Stamina = false
local stam = nil

RegisterNetEvent("sho_adminmenu:toggle_Stamina", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if Stamina then
                Stamina = false
                ClearInterval(stam)
                lib.notify({title = "Staff Menu", description = "Stamina Off", type = "inform"})
            else
                Stamina = true
                stam = SetInterval(function()
                    RestorePlayerStamina(PlayerId(), 1.0)
                end, 100)
                lib.notify({title = "Staff Menu", description = "Stamina On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_Stamina")
end)

local FastSwim = false

RegisterNetEvent("sho_adminmenu:toggle_FastSwim", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if FastSwim then
                FastSwim = false
                SetSwimMultiplierForPlayer(PlayerId(), 1.0)
                lib.notify({title = "Staff Menu", description = "FastSwim Off", type = "inform"})
            else
                FastSwim = true
                SetSwimMultiplierForPlayer(PlayerId(), 1.49)
                lib.notify({title = "Staff Menu", description = "FastSwim On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_FastSwim")
end)

local SuperJumpp = false
local superjump = nil

RegisterNetEvent("sho_adminmenu:toggle_SuperJump", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if SuperJumpp then
                SuperJumpp = false
                ClearInterval(superjump)
                lib.notify({title = "Staff Menu", description = "SuperJump Off", type = "inform"})
            else
                SuperJumpp = true
                superjump = SetInterval(function()
                    SetSuperJumpThisFrame(PlayerId())
                end, 0)
                lib.notify({title = "Staff Menu", description = "SuperJump On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_SuperJump")
end)

local NoRagDoll = false
local ragdoll = nil

RegisterNetEvent("sho_adminmenu:toggle_NoRagDoll", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if NoRagDoll then
                NoRagDoll = false
                SetPedCanRagdollFromPlayerImpact(PlayerPedId(), true)
                SetPedCanRagdoll(PlayerPedId(), true)
                ClearInterval(ragdoll)
                lib.notify({title = "Staff Menu", description = "RagDoll Off", type = "inform"})
            else
                NoRagDoll = true
                ragdoll = SetInterval(function()
                    SetPedCanRagdoll(PlayerPedId(), false)
                    SetPedCanRagdollFromPlayerImpact(PlayerPedId(), false)
                end, 0)
                lib.notify({title = "Staff Menu", description = "RagDoll On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_NoRagDoll")
end)

RegisterNetEvent("sho_adminmenu:SetArmor", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Set Armor", {
                {
                    type = "select",
                    label = "Select Armor",
                    options = {
                        {value = "20% Armor", label = "Super Light Armor"},
                        {value = "40% Armor", label = "Light Armor"},
                        {value = "60% Armor", label = "Standard Armor"},
                        {value = "80% Armor", label = "Heavy Armor"},
                        {value = "100% Armor", label = "Super Heavy Armor"}
                    }
                }
            })
            if input[1] == "20% Armor" then
                SetPedArmour(PlayerPedId(), 20)
            elseif input[1] == "40% Armor" then
                SetPedArmour(PlayerPedId(), 40)
            elseif input[1] == "60% Armor" then
                SetPedArmour(PlayerPedId(), 60)
            elseif input[1] == "80% Armor" then
                SetPedArmour(PlayerPedId(), 80)
            elseif input[1] == "100% Armor" then
                SetPedArmour(PlayerPedId(), 100)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_SetArmor")
end)

RegisterNetEvent("sho_adminmenu:CleanPlayerClothes", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            ClearPedBloodDamage(PlayerPedId())
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_CleanPlayerClothes")
end)

RegisterNetEvent("sho_adminmenu:WetPlayerClothes", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            SetPedWetnessHeight(PlayerPedId(), 2.0)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_WetPlayerClothes")
end)

RegisterNetEvent("sho_adminmenu:DryPlayerClothes", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            ClearPedWetness(PlayerPedId())
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_DryPlayerClothes")
end)

RegisterNetEvent("sho_adminmenu:CommitSuicide", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            SetEntityHealth(PlayerPedId(), 0.0)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_CommitSuicide")
end)

local FeezePlayer = false

RegisterNetEvent("sho_adminmenu:FeezePlayer", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if FeezePlayer then
                FeezePlayer = false
                FreezeEntityPosition(PlayerPedId(), false)
                lib.notify({title = "Staff Menu", description = "Player UnFreeze", type = "inform"})
            else
                FeezePlayer = true
                FreezeEntityPosition(PlayerPedId(), true)
                lib.notify({title = "Staff Menu", description = "Player Freeze", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_FeezePlayer")
end)

local Noclip = false

RegisterNetEvent("sho_adminmenu:toggle_noclip", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if Noclip then
                Noclip = false
                SetNoClip(false)
                lib.notify({title = "Staff Menu", description = "Noclip Off", type = "inform"})
            else
                Noclip = true
                SetNoClip(true)
                lib.notify({title = "Staff Menu", description = "Noclip On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_Noclip")
end)

local SetPlayerSkin = function(ped)
    local modelHash = GetHashKey(ped)
    if IsModelInCdimage(modelHash) and IsModelValid(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end
        if GetEntityModel(PlayerPedId()) ~= modelHash then
            SetPlayerModel(PlayerId(), modelHash)
            SetModelAsNoLongerNeeded(modelHash)
            SetPedDefaultComponentVariation(PlayerPedId())
            ClearAllPedProps(PlayerPedId())
            ClearPedDecorations(PlayerPedId())
            ClearPedFacialDecorations(PlayerPedId())
        end
    end
end

RegisterNetEvent("sho_adminmenu:client:PedOptions", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "ped_options",
                title = "🧍‍♂️ Ped Options",
                menu = "player_related_options",
                options = {
                    ["👕 Change Appearance"] = {event = "esx_mroupa:openSaveableMenu", description = "Change Ped Appearance"},
                    ["👦🏻 Change To Addon Ped"] = {event = "sho_adminmenu:client:ChangePed", description = "Change Ped Model"}
                }
            })
            lib.showContext("ped_options")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions")
end)

RegisterNetEvent("sho_adminmenu:client:ChangePed", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu", {"Model Name"})
            if input then
                local ped = input[1]
                if ped == nil then
                    return lib.notify({title = "Staff Menu", description = "Inválid Model", type = "error"})
                end
                SetPlayerSkin(ped)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "PlayerRelatedOptions_ChangePed")
end)

RegisterNetEvent("sho_adminmenu:MiscOptions", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "misc_settings",
                title = "🚧 Misc Settings",
                menu = "admin_menu",
                options = {
                    ["🕹 Teleport To Coords"] = {event = "sho_adminmenu:client:TTC", description = "Teleport To Coords"},
                    ["📲 Show Coords"] = {event = "sho_adminmenu:toggle_coords", description = "Show Coords"},
                    ["🕹 Clear Area"] = {event = "sho_adminmenu:ClearArea", description = "Clear Area"},
                    ["🕹 Relog"] = {serverEvent = "esx_multicharacter:relog", description = "Relog from Server"},
                    ["🔍 Thermal Vision"] = {event = "sho_adminmenu:toggle_thermalvision", description = "Thermal Vision"},
                    ["🔍 Night Vision"] = {event = "sho_adminmenu:toggle_nightvision", description = "Thermal Vision"}
                }
            })
            lib.showContext("misc_settings")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "MiscSettings")
end)

RegisterNetEvent("sho_adminmenu:client:TTC", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local input = lib.inputDialog("Staff Menu", {"Coords X", "Coords Y", "Coords Z"})
            if input then
                local cx = tonumber(input[1])
                local cy = tonumber(input[2])
                local cz = tonumber(input[3])
                if cx == nil or cy == nil or cz == nil then
                    return
                end
                SetPedCoordsKeepVehicle(PlayerPedId(), vec3(tonumber(cx), tonumber(cy), tonumber(cz)))
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "MiscSettings_ttc")
end)

local DrawGenericText = function(text)
    SetTextColour(186, 186, 186, 255)
    SetTextFont(7)
    SetTextScale(0.378, 0.378)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.40, 0.00)
end

local FormatCoord = function(coord)
    if coord == nil then
        return "unknown"
    end
    return tonumber(string.format("%.2f", coord))
end

local ShowCoords = false

RegisterNetEvent("sho_adminmenu:toggle_coords", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if ShowCoords then
                ShowCoords = false
                ClearInterval(showcoordsint)
            else
                ShowCoords = true
                showcoordsint = SetInterval(function()
                    local playerPed = PlayerPedId()
                    local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
                    local playerH = GetEntityHeading(playerPed)
                    DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
                end, 5)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "MiscSettings_ShowCoords")
end)

RegisterNetEvent("sho_adminmenu:ClearArea", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local coords = GetEntityCoords(PlayerPedId())
            ClearAreaLeaveVehicleHealth(coords.x, coords.y, coords.z, 100.0, false, false, false, false)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "MiscSettings_ClearArea")
end)

local ThermalVision = false

RegisterNetEvent("sho_adminmenu:toggle_thermalvision", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if ThermalVision then
                ThermalVision = false
                SetSeethrough(false)
                lib.notify({title = "Staff Menu", description = "Thermal Vision Off", type = "inform"})
            else
                ThermalVision = true
                SetSeethrough(true)
                lib.notify({title = "Staff Menu", description = "Thermal Vision On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "MiscSettings_ThermalVision")
end)

local NightVision = false

RegisterNetEvent("sho_adminmenu:toggle_nightvision", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            if NightVision then
                NightVision = false
                SetNightvision(false)
                lib.notify({title = "Staff Menu", description = "Night Vision Off", type = "inform"})
            else
                NightVision = true
                SetNightvision(true)
                lib.notify({title = "Staff Menu", description = "Night Vision On", type = "inform"})
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "MiscSettings_NightVision")
end)

RegisterNetEvent("sho_adminmenu:TrollMenu", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "troll_menu",
                title = "🚧 Troll Menu",
                menu = "admin_menu",
                options = {
                    ["🚚 Truck Punchline"] = {event = "sho_adminmenu:client:TruckPunchlinePly", description = "Truck Punchline"},
                    ["🧛 Clown Attack"] = {event = "sho_adminmenu:client:ClownAttackPly", description = "Clown Attack"},
                    ["👨‍🎤 Merryweather Attack"] = {event = "sho_adminmenu:client:MerryAttackPly", description = "Merryweather Attack"},
                    ["👨‍🎤 Flashbang"] = {event = "sho_adminmenu:client:Flashbangply", description = "Flashbang"},
                    ["⚰️ Lag Game"] = {event = "sho_adminmenu:client:Lagply", description = "Lag Game"},
                    ["🕹 Blow Tyres"] = {event = "sho_adminmenu:client:BlowPly", description = "Blow Tyres"},
                    ["🦵🏻 Eject From Veh"] = {event = "sho_adminmenu:client:EjectPly", description = "Eject From Veh"},
                    ["⚰️ Crash Game"] = {event = "sho_adminmenu:client:Crashply", description = "Crash Game"}
                }
            })
            lib.showContext("troll_menu")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu")
end)

RegisterNetEvent("sho_adminmenu:client:TruckPunchlinePly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:TruckPunchlinePly",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Truck")
end)

RegisterNetEvent("sho_adminmenu:troll:TruckPunchline", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local playerPed = PlayerPedId()
            local pCoords = GetEntityCoords(playerPed)
            local pRot = GetEntityRotation(playerPed)
            RequestModel("rubble")
            repeat
                Wait(10)
            until HasModelLoaded("rubble")
            FreezeEntityPosition(playerPed, true)
            if IsPedInAnyVehicle(playerPed, false) then
                FreezeEntityPosition(GetVehiclePedIsIn(playerPed, false), true)
            end
            local arrowSpawn = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 3.0, 0.0)
            local vehSpawn = GetOffsetFromEntityInWorldCoords(playerPed, -10.0, 0.0, 0.0)
            local veh = CreateVehicle("rubble", vehSpawn, pRot.z - 90, true, false)
            DisableVehicleWorldCollision(veh)
            SetEntityCoords(veh, vehSpawn, 0.0, 0.0, pRot.z - 90.0, true)
            FreezeEntityPosition(veh, true)
            local i = 1
            local loop = 0
            local draw = true
            repeat
                i = i + 1
                if i == 1 then
                    draw = true
                elseif i == 80 then
                    draw = false
                elseif i == 160 then
                    draw = false
                    loop = loop + 1
                    i = 0
                end
                if draw then
                    DrawMarker(21, arrowSpawn.x, arrowSpawn.y, arrowSpawn.z + 0.5, 0.0, 0.0, 0.0, 0.0, 270.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 160, false, true, 2)
                end
                Wait(0)
            until (loop == 3)
            FreezeEntityPosition(veh, false)
            SetEntityRotation(veh, 0.0, 0.0, pRot.z - 90.0, 0, true)
            SetVehicleForwardSpeed(veh, 80.0)
            FreezeEntityPosition(playerPed, false)
            if IsPedInAnyVehicle(playerPed, false) then
                FreezeEntityPosition(GetVehiclePedIsIn(playerPed, false), false)
            end
            Wait(6000)
            SetEntityAsMissionEntity(veh, true, true)
            DeleteEntity(veh)
            FreezeEntityPosition(playerPed, false)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Truck")
end)

RegisterNetEvent("sho_adminmenu:client:ClownAttackPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:ClownAttackPly",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Clown")
end)

RegisterNetEvent("sho_adminmenu:troll:ClownAttack", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local playerPed = PlayerPedId()
            local pCoords = GetEntityCoords(playerPed)
            RequestModel("speedo2")
            repeat
                Wait(10)
            until HasModelLoaded("speedo2")
            RequestModel("s_m_y_clown_01")
            repeat
                Wait(10)
            until HasModelLoaded("s_m_y_clown_01")
            repeat
                found, SpawnCoords = FindSpawnPointInDirection(pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 100.0)
                Wait(100)
            until found
            local veh = CreateVehicle("speedo2", SpawnCoords, 0, true, false)
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 11, 3, false)
            SetVehicleMod(veh, 12, 3, false)
            SetVehicleMod(veh, 13, 3, false)
            ToggleVehicleMod(veh, 18, true)
            AddRelationshipGroup("CLOWNS")
            AddRelationshipGroup("ASSASINTARGET")
            SetPedRelationshipGroupHash(playerPed, "ASSASINTARGET")
            SetRelationshipBetweenGroups(5, "CLOWNS", "ASSASINTARGET")
            SetRelationshipBetweenGroups(0, "CLOWNS", "CLOWNS")
            local peds = {}
            for i = -1, 4 do
                local ped = CreatePedInsideVehicle(veh, "WHATEVER", "s_m_y_clown_01", i, true, false)
                table.insert(peds, ped)
                GiveWeaponToPed(ped, "weapon_microsmg", 999, false, true)
                SetPedRelationshipGroupDefaultHash(ped, "CLOWNS")
                SetPedRelationshipGroupHash(ped, "CLOWNS")
                SetPedCombatAbility(ped, 2)
                SetPedCombatMovement(ped, 3)
                SetPedCombatRange(ped, 2)
                SetPedCombatAttributes(ped, 46, true)
                SetPedCombatAttributes(ped, 2, true)
                SetPedCombatAttributes(ped, 3, false)
                SetPedCombatAttributes(ped, 20, false)
                TaskCombatPed(ped, playerPed, 0, 16)
            end
            local allPedsDead
            repeat
                Wait(100)
                local alivePeds = {}
                for i, ped in pairs(peds) do
                    if not IsPedDeadOrDying(ped, true) then
                        table.insert(alivePeds, ped)
                    end
                end
                for i, ped in pairs(alivePeds) do
                    local pedVeh = GetVehiclePedIsUsing(ped)
                    if pedVeh ~= 0 and GetEntityHealth(pedVeh) < 100 then
                        ClearPedTasks(ped)
                        TaskLeaveVehicle(ped, pedVeh, 4160)
                        Wait(5000)
                        ClearPedTasks(ped)
                        TaskCombatPed(ped, playerPed, 0, 16)
                    end
                end
                if #alivePeds == 0 then
                    allPedsDead = true
                end
            until (IsPedDeadOrDying(PlayerPedId(), true) or allPedsDead)
            for i, ped in pairs(peds) do
                if not IsPedDeadOrDying(ped, true) then
                    ClearPedTasks(ped)
                    TaskVehicleDriveWander(ped, veh, 60.0, 524860)
                    SetPedAsNoLongerNeeded(ped)
                else
                    SetPedAsNoLongerNeeded(ped)
                end
            end
            SetVehicleAsNoLongerNeeded(veh)
            SetModelAsNoLongerNeeded("speedo2")
            SetModelAsNoLongerNeeded("s_m_y_clown_01")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Clown")
end)

RegisterNetEvent("sho_adminmenu:client:MerryAttackPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:MerryAttackPly",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Merry")
end)

RegisterNetEvent("sho_adminmenu:troll:MerryAttack", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local playerPed = PlayerPedId()
            local pCoords = GetEntityCoords(playerPed)
            RequestModel("mesa3")
            repeat
                Wait(10)
            until HasModelLoaded("mesa3")
            RequestModel("S_M_Y_BlackOps_01")
            repeat
                Wait(10)
            until HasModelLoaded("S_M_Y_BlackOps_01")
            repeat
                found, SpawnCoords = FindSpawnPointInDirection(pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 100.0)
                Wait(100)
            until found
            local veh = CreateVehicle("mesa3", SpawnCoords, 0, true, false)
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 11, 3, false)
            SetVehicleMod(veh, 12, 3, false)
            SetVehicleMod(veh, 13, 3, false)
            ToggleVehicleMod(veh, 18, true)
            AddRelationshipGroup("CLOWNS")
            AddRelationshipGroup("ASSASINTARGET")
            SetPedRelationshipGroupHash(playerPed, "ASSASINTARGET")
            SetRelationshipBetweenGroups(5, "CLOWNS", "ASSASINTARGET")
            SetRelationshipBetweenGroups(0, "CLOWNS", "CLOWNS")
            local peds = {}
            for i = -1, 3 do
                local ped = CreatePedInsideVehicle(veh, "WHATEVER", "S_M_Y_BlackOps_01", i, true, false)
                table.insert(peds, ped)
                GiveWeaponToPed(ped, "weapon_machinepistol", 999, false, true)
                SetPedRelationshipGroupDefaultHash(ped, "CLOWNS")
                SetPedRelationshipGroupHash(ped, "CLOWNS")
                SetPedCombatAbility(ped, 2)
                SetPedCombatMovement(ped, 3)
                SetPedCombatRange(ped, 2)
                SetPedCombatAttributes(ped, 46, true)
                SetPedCombatAttributes(ped, 2, true)
                SetPedCombatAttributes(ped, 3, false)
                SetPedCombatAttributes(ped, 20, false)
                TaskCombatPed(ped, playerPed, 0, 16)
            end
            local allPedsDead
            repeat
                Wait(100)
                local alivePeds = {}
                for i, ped in pairs(peds) do
                    if not IsPedDeadOrDying(ped, true) then
                        table.insert(alivePeds, ped)
                    end
                end
                for i, ped in pairs(alivePeds) do
                    local pedVeh = GetVehiclePedIsUsing(ped)
                    if pedVeh ~= 0 and GetEntityHealth(pedVeh) < 100 then
                        ClearPedTasks(ped)
                        TaskLeaveVehicle(ped, pedVeh, 4160)
                        Wait(5000)
                        ClearPedTasks(ped)
                        TaskCombatPed(ped, playerPed, 0, 16)
                    end
                end
                if #alivePeds == 0 then
                    allPedsDead = true
                end
            until (IsPedDeadOrDying(PlayerPedId(), true) or allPedsDead)
            for i, ped in pairs(peds) do
                if not IsPedDeadOrDying(ped, true) then
                    ClearPedTasks(ped)
                    TaskVehicleDriveWander(ped, veh, 60.0, 524860)
                    SetPedAsNoLongerNeeded(ped)
                else
                    SetPedAsNoLongerNeeded(ped)
                end
            end
            SetVehicleAsNoLongerNeeded(veh)
            SetModelAsNoLongerNeeded("mesa3")
            SetModelAsNoLongerNeeded("S_M_Y_BlackOps_01")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Merry")
end)

RegisterNetEvent("sho_adminmenu:client:Flashbangply", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:FlashPly",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Flash")
end)

RegisterNetEvent("sho_adminmenu:troll:FlashPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            SetTimecycleModifier("mp_corona_heist_bw");
            SetTimecycleModifierStrength(1.0)
            intensity = 1.0
            Wait(1000)
            repeat
                ShakeGameplayCam("LARGE_EXPLOSION_SHAKE", 0.5)
                SetTimecycleModifierStrength(intensity)
                intensity = intensity - 0.01
                Wait(50)
            until intensity <= 0.1
            ClearTimecycleModifier()
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Flash")
end)

RegisterNetEvent("sho_adminmenu:client:Lagply", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:LagGame",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Lag")
end)

Citizen.CreateThread(function()
    local stopGrief = false
    local griefRunning = false
    RegisterNetEvent("sho_adminmenu:troll:LagGame", function()
        ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
            if allowed then
                if griefRunning then
                    stopGrief = true
                    griefRunning = false
                    return
                elseif stopGrief then
                    stopGrief = false
                end
                griefRunning = true
                repeat
                    for i = 1, 100000 do
                        GetPlayerPed(PlayerId())
                    end
                    Wait(0)
                until stopGrief
            else
                lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
            end
        end, "TrollMenu_Lag")
    end)
end)

RegisterNetEvent("sho_adminmenu:client:BlowPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:BlowPly",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_BlowTyre")
end)

RegisterNetEvent("sho_adminmenu:troll:BlowPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh and veh ~= 0 then
                for i = 0, 6 do
                    SetVehicleTyreBurst(veh, i, true, 1000.0)
                end
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_BlowTyre")
end)

RegisterNetEvent("sho_adminmenu:client:EjectPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:EjectPly",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Eject")
end)

RegisterNetEvent("sho_adminmenu:troll:EjectPly", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if veh and veh ~= 0 then
                ClearPedTasksImmediately(ped)
                local coords = GetEntityCoords(ped)
                local axis = GetEntityRotation(ped)
                SetEntityCoords(ped, coords.x, coords.y, coords.z + 0.1, 0, 0, axis, false)
                SetPedToRagdoll(ped, 10, 10, 2, true, true, true)
                SetEntityVelocity(ped, 0, 0, 10.0)
            end
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Eject")
end)

RegisterNetEvent("sho_adminmenu:client:Crashply", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.callback("sho_adminmenu:server:GetOnlinePlayers", false, function(plyList)
                local myMenu = {}
                for k, v in pairs(plyList) do
                    myMenu[v.name] = {
                        description = v.name.." ID: "..v.source,
                        arrow = true,
                        serverEvent = "sho_adminmenu:server:Crashply",
                        args = {plyid = v.source}
                    }
                end
                lib.registerContext({id = "online_players", title = "🧍‍♂️ Online Players", menu = "troll_menu", options = myMenu})
                lib.showContext("online_players")
            end)
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Crash")
end)

RegisterNetEvent("sho_adminmenu:troll:Crashply", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            repeat
            until false
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "TrollMenu_Crash")
end)

RegisterNetEvent("sho_adminmenu:RockstarSettings", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.registerContext({
                id = "rockstar_settings",
                title = "📸 Rockstar Editor",
                menu = "admin_menu",
                options = {
                    ["🎥 Start Recording"] = {event = "sho_adminmenu:record", description = "Start Recording"},
                    ["🎥 Save Recording"] = {event = "sho_adminmenu:saveclip", description = "Save Recording"},
                    ["🎥 Discard Recording"] = {event = "sho_adminmenu:delclip", description = "Discard Recording"},
                    ["🎥 Open Editor"] = {event = "sho_adminmenu:editor", description = "Open Editor"}
                }
            })
            lib.showContext("rockstar_settings")
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "RockstarEditor")
end)

RegisterNetEvent("sho_adminmenu:record", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            StartRecording(1)
            lib.notify({title = "Staff Menu", description = "Started recording", type = "inform"})
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "RockstarEditor_Record")
end)

RegisterNetEvent("sho_adminmenu:saveclip", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            StartRecording(0)
            StopRecordingAndSaveClip()
            lib.notify({title = "Staff Menu", description = "Saved recording", type = "inform"})
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "RockstarEditor_SaveClip")
end)

RegisterNetEvent("sho_adminmenu:delclip", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            StopRecordingAndDiscardClip()
            lib.notify({title = "Staff Menu", description = "Discarded recording", type = "inform"})
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "RockstarEditor_DelClip")
end)

RegisterNetEvent("sho_adminmenu:editor", function()
    ESX.TriggerServerCallback("sho_adminmenu:server:IsAllowed", function(allowed)
        if allowed then
            lib.notify({title = "Staff Menu", description = "Opening Rockstar Editor", type = "inform"})
            NetworkSessionLeaveSinglePlayer()
            ActivateRockstarEditor()
        else
            lib.notify({title = "Staff Menu", description = "You do not have permission for this action", type = "error"})
        end
    end, "RockstarEditor_Editor")
end)