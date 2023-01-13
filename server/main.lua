local SHOAdmins = {}

RegisterNetEvent("onResourceStart", function()
    for k, v in ipairs(Admins) do
        SHOAdmins[v] = {
            permission = {OpenAdminmenu = true}
        }
        for i, j in ipairs(FullAccess) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.FullAccess = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_SendMessage) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_SendMessage = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_ChangeSkin) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_ChangeSkin = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_OpenInventory) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_OpenInventory = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_SetJob) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_SetJob = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_GiveItem) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_GiveItem = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_RemoveInventoryItem) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_RemoveInventoryItem = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_GiveMoney) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_GiveMoney = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_RemoveMoney) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_RemoveMoney = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_License) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_License = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_Heal) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_Heal = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_Revive) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_Revive = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_Goto) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_Goto = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_Bring) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_Bring = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_PRINTID) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_PRINTID = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_KillPlayer) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_KillPlayer = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_KickPlayer) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_KickPlayer = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_ScreenShopPlayer) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_ScreenShopPlayer = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_SpectatePlayer) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.OnlinePlyOptions_SpectatePlayer = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_DeleteVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_DeleteVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_UnlockVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_UnlockVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_SpawnCustomVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_SpawnCustomVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_VehicleOptions) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_VehicleOptions = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_FreezeVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_FreezeVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_Engine) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_Engine = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_ChangeNumberPlate) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_ChangeNumberPlate = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_FlipVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_FlipVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_DeleteVehiclePlayer) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_DeleteVehiclePlayer = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_VehicleGodMode) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_VehicleGodMode = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_RepairVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_RepairVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_WashVehicle) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_WashVehicle = true
            end
        end
        for i, j in ipairs(VehicleRelatedOptions_KeepVehicleClean) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.VehicleRelatedOptions_KeepVehicleClean = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_PlayerOptions) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_PlayerOptions = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_GodMode) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_GodMode = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_Invisible) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_Invisible = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_Stamina) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_Stamina = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_FastSwim) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_FastSwim = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_SuperJump) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_SuperJump = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_NoRagDoll) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_NoRagDoll = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_SetArmor) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_SetArmor = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_CleanPlayerClothes) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_CleanPlayerClothes = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_WetPlayerClothes) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_WetPlayerClothes = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_DryPlayerClothes) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_DryPlayerClothes = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_CommitSuicide) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_CommitSuicide = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_FeezePlayer) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_FeezePlayer = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_Noclip) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_Noclip = true
            end
        end
        for i, j in ipairs(PlayerRelatedOptions_ChangePed) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.PlayerRelatedOptions_ChangePed = true
            end
        end
        for i, j in ipairs(MiscSettings) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.MiscSettings = true
            end
        end
        for i, j in ipairs(MiscSettings_ttc) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.MiscSettings_ttc = true
            end
        end
        for i, j in ipairs(MiscSettings_ShowCoords) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.MiscSettings_ShowCoords = true
            end
        end
        for i, j in ipairs(MiscSettings_ClearArea) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.MiscSettings_ClearArea = true
            end
        end
        for i, j in ipairs(MiscSettings_ThermalVision) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.MiscSettings_ThermalVision = true
            end
        end
        for i, j in ipairs(MiscSettings_NightVision) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.MiscSettings_NightVision = true
            end
        end
        for i, j in ipairs(TrollMenu) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu = true
            end
        end
        for i, j in ipairs(TrollMenu_Truck) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Truck = true
            end
        end
        for i, j in ipairs(TrollMenu_Clown) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Clown = true
            end
        end
        for i, j in ipairs(TrollMenu_Merry) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Merry = true
            end
        end
        for i, j in ipairs(TrollMenu_Flash) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Flash = true
            end
        end
        for i, j in ipairs(TrollMenu_Lag) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Lag = true
            end
        end
        for i, j in ipairs(TrollMenu_BlowTyre) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_BlowTyre = true
            end
        end
        for i, j in ipairs(TrollMenu_Eject) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Eject = true
            end
        end
        for i, j in ipairs(TrollMenu_Crash) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.TrollMenu_Crash = true
            end
        end
        for i, j in ipairs(RockstarEditor) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.RockstarEditor = true
            end
        end
        for i, j in ipairs(RockstarEditor_Record) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.RockstarEditor_Record = true
            end
        end
        for i, j in ipairs(RockstarEditor_SaveClip) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.RockstarEditor_SaveClip = true
            end
        end
        for i, j in ipairs(RockstarEditor_DelClip) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.RockstarEditor_DelClip = true
            end
        end
        for i, j in ipairs(RockstarEditor_Editor) do
            if SHOAdmins[j] then
                SHOAdmins[j].permission.RockstarEditor_Editor = true
            end
        end
    end
end)

CheckAllowed = function(source, type, type2)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local group = xPlayer.getGroup()
    local identifier = xPlayer.getIdentifier()
    local tonyaction = type
    local tonyaction2 = type2
    local allowed = false
    if group == "zadmin" or group == "zsuperadmin" then
        allowed = true
    else
        if SHOAdmins[identifier] then
            if SHOAdmins[identifier].permission[tonyaction] or SHOAdmins[identifier].permission[tonyaction2] or
                SHOAdmins[identifier].permission.FullAccess then
                allowed = true
                goto continue
            end
        else
            for k, v in pairs(GetPlayerIdentifiers(xPlayer.source)) do
                if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    if SHOAdmins[v] then
                        if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or
                            SHOAdmins[v].permission.FullAccess then
                            allowed = true
                            goto continue
                        end
                    end
                elseif string.sub(v, 1, string.len("license:")) == "license:" then
                    if SHOAdmins[v] then
                        if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or
                            SHOAdmins[v].permission.FullAccess then
                            allowed = true
                            goto continue
                        end
                    end
                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                    if SHOAdmins[v] then
                        if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or
                            SHOAdmins[v].permission.FullAccess then
                            allowed = true
                            goto continue
                        end
                    end
                elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    if SHOAdmins[v] then
                        if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or
                            SHOAdmins[v].permission.FullAccess then
                            allowed = true
                            goto continue
                        end
                    end
                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                    if SHOAdmins[v] then
                        if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or
                            SHOAdmins[v].permission.FullAccess then
                            allowed = true
                            goto continue
                        end
                    end
                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                    if SHOAdmins[v] then
                        if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or
                            SHOAdmins[v].permission.FullAccess then
                            allowed = true
                            goto continue
                        end
                    end
                end
            end
        end
    end
    ::continue::
    return allowed
end

ESX.RegisterServerCallback("sho_adminmenu:server:IsAllowed", function(source, cb, action, action2)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local allowed = false
    if xPlayer then
        local group = xPlayer.getGroup()
        local identifier = xPlayer.getIdentifier()
        local tonyaction = action
        local tonyaction2 = action2 or action
        if group == "zadmin" or group == "zsuperadmin" then
            allowed = true
        else
            if SHOAdmins[identifier] then
                if SHOAdmins[identifier].permission[tonyaction] or SHOAdmins[identifier].permission[tonyaction2] or SHOAdmins[identifier].permission.FullAccess then
                    allowed = true
                    goto continue
                end
            else
                for k, v in pairs(GetPlayerIdentifiers(xPlayer.source)) do
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then
                        if SHOAdmins[v] then
                            if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or SHOAdmins[v].permission.FullAccess then
                                allowed = true
                                goto continue
                            end
                        end
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then
                        if SHOAdmins[v] then
                            if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or SHOAdmins[v].permission.FullAccess then
                                allowed = true
                                goto continue
                            end
                        end
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                        if SHOAdmins[v] then
                            if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or SHOAdmins[v].permission.FullAccess then
                                allowed = true
                                goto continue
                            end
                        end
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                        if SHOAdmins[v] then
                            if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or SHOAdmins[v].permission.FullAccess then
                                allowed = true
                                goto continue
                            end
                        end
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                        if SHOAdmins[v] then
                            if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or SHOAdmins[v].permission.FullAccess then
                                allowed = true
                                goto continue
                            end
                        end
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then
                        if SHOAdmins[v] then
                            if SHOAdmins[v].permission[tonyaction] or SHOAdmins[v].permission[tonyaction2] or SHOAdmins[v].permission.FullAccess then
                                allowed = true
                                goto continue
                            end
                        end
                    end
                end
            end
        end
    end
    ::continue::
    cb(allowed)
end)

local TSGetPlayers = function()
    local players = ESX.GetPlayers()
    local plylist = {}
    for i = 1, #players, 1 do
  	local plytable = {source = players[i], name = GetPlayerName(players[i])}
        table.insert(plylist, plytable)
    end
    table.sort(plylist, function(a, b) return a.name:upper() < b.name:upper() end)
    return plylist
end

lib.callback.register("sho_adminmenu:server:GetOnlinePlayers", function()
    return TSGetPlayers()
end)

RegisterNetEvent("sho_adminmenu:server:SendMessage", function(pid, msg)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local message = msg
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_SendMessage")
    if allowed then
        TriggerClientEvent('chat:addMessage', yPlayer.source, {template = '<div class="chat-message system"><i class="fas fa-comment"></i> <b><span style="color: #df7b00">{0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"> - {1}</span></b><div style="margin-top: 5px; font-weight: 300;"><b>{2}</b></div></div>', args = {"Staff Menu", xPlayer.getName(), msg}})
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:ChangeSkin", function(ply)
    local yPlayer = ESX.GetPlayerFromId(ply)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_ChangeSkin")
    if allowed then
        yPlayer.triggerEvent("esx_skin:openSaveableMenu")
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:ShowInventory", function(ply)
    local src = source
    local Ply = ply
    local allowed = CheckAllowed(src, "OnlinePlyOptions_OpenInventory")
    if allowed then
        local inv = exports.ox_inventory:Inventory(tonumber(Ply))
        TriggerClientEvent("ox_inventory:viewInventory", src, inv)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

ESX.RegisterServerCallback("sho_adminmenu:server:GetJobs", function(source, cb)
    local jobs = ESX.GetJobs()
    cb(jobs)
end)

RegisterNetEvent("sho_adminmenu:server:GiveItem", function(pid, item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = pid
    local titem = item
    local amount = count
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local allowed = CheckAllowed(source, "OnlinePlyOptions_GiveItem")
    if allowed then
        exports.ox_inventory:AddItem(yPlayer.playerId, titem, amount, nil, nil, nil)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:GetItems", function(pid)
    local src = source
    local playerId = pid
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local item = exports.ox_inventory:Inventory(playerId).items
    local allowed = CheckAllowed(source, "OnlinePlyOptions_RemoveInventoryItem")
    if allowed then
        table.sort(item, function(a, b)
            return a.name:upper() < b.name:upper()
        end)
        TriggerClientEvent("sho_adminmenu:client:RemoveItem", src, pid, item)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:RemoveItem", function(pid, item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = pid
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local titem = item
    local amount = count
    local allowed = CheckAllowed(source, "OnlinePlyOptions_RemoveInventoryItem")
    if allowed then
        exports.ox_inventory:RemoveItem(yPlayer.playerId, titem, amount, nil, nil)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:GiveAccMoney", function(pid, acc, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_GiveMoney")
    local account = acc
    local money = tonumber(amount)
    if allowed then
        if account == "money" or account == "bank" or account == "black_money" then
            yPlayer.addAccountMoney(account, money)
        end
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:RemoveAccMoney", function(pid, acc, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_RemoveMoney")
    local account = acc
    local money = tonumber(amount)
    if allowed then
        if account == "money" or account == "bank" or account == "black_money" then
            yPlayer.removeAccountMoney(account, money)
        end
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:ToggleLicense", function(playerId, license)
    local playerId = playerId
    local license = license
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_License")
    if allowed then
        local found = false
        TriggerEvent("esx_license:getLicensesList", function(licenses)
            for i, l in pairs(licenses) do
                if l.type == license then
                    found = true
                    TriggerEvent("esx_license:checkLicense", playerId, license, function(hasLicense)
                        if hasLicense then
                            TriggerEvent("esx_license:removeLicense", playerId, license)
                            TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = yPlayer.getName(playerId) .. "'s" .. license .. " has been removed", type = "success"})
                        else
                            TriggerEvent("esx_license:addLicense", playerId, license)
                            TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = yPlayer.getName(playerId) .. " has been added the license " .. license, type = "success"})
                        end
                    end)
                end
            end
        end)
        Wait(3000)
        if not found then
            TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "This License does not exist.", type = "error"})
        end
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:HealPlayer", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_Heal")
    if allowed then
        yPlayer.triggerEvent("esx_basicneeds:healPlayer")
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:RevivePlayer", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_Revive")
    if allowed then
        yPlayer.triggerEvent("esx_ambulancejob:revive")
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:Goto", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_Goto")
    local yPlyCoords = yPlayer.getCoords()
    if allowed then
        xPlayer.setCoords(yPlyCoords)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:Bring", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local xPlyCoords = xPlayer.getCoords()
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_Bring")
    if allowed then
        yPlayer.setCoords(xPlyCoords)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:PrintID", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_PRINTID")
    local steamid, license, xbl, ip, discord, liveid = nil, nil, nil, nil, nil, nil
    if allowed then
        for k, v in pairs(GetPlayerIdentifiers(yPlayer.source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                steamid = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xbl = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                ip = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
            end
        end
        TriggerClientEvent("sho_adminmenu:PrintID", xPlayer.source, steamid, license, xbl, ip, discord, liveid)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:KillPlayer", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_KillPlayer")
    if allowed then
        TriggerClientEvent("sho_adminmenu:client:Kill", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:KickPlayer", function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_KickPlayer")
    if allowed then
        yPlayer.kick("You Have been kicked from the server by: " .. xPlayer.getName())
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

lib.callback.register("sho_adminmenu:server:GetSpectateData", function(source, pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowed = CheckAllowed(xPlayer.source, "OnlinePlyOptions_SpectatePlayer")
    if allowed then
        local src = source
        local target = pid
        local pCoords = GetEntityCoords(GetPlayerPed(target))
        return pCoords
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

local TSGetVehiclesInArea = function(coords, maxDistance, modelFilter)
	return TSGetNearbyEntities(GetAllVehicles(), coords, modelFilter, maxDistance)
end

RegisterNetEvent("sho_adminmenu:server:DeleteVehicle", function(radi)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowed = CheckAllowed(xPlayer.source, "VehicleRelatedOptions_DeleteVehicle")
    local radius = 1.0
    if radi then
        radius = tonumber(radi) + 0.0
    end
    local veh = GetVehiclePedIsIn(GetPlayerPed(xPlayer.source))
    if allowed then
        if veh ~= 0 then
            DeleteEntity(veh)
        else
            veh = TSGetVehiclesInArea(GetEntityCoords(GetPlayerPed(xPlayer.source)), radius)
            for i = 1, #veh do
                DeleteEntity(veh[i].entity)
            end
        end
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

local TSSpawnVehicle = function(model, coords, heading, cb)
	if type(model) == "string" then
        model = GetHashKey(model)
    end
	CreateThread(function()
		local entity = Citizen.InvokeNative(`CREATE_AUTOMOBILE`, model, coords.x, coords.y, coords.z, heading)
		while not DoesEntityExist(entity) do
            Wait(50)
        end
		cb(entity)
	end)
end

RegisterNetEvent("sho_adminmenu:server:SpawnVehicle", function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(source)
    local model = veh
    local vehicle = GetVehiclePedIsIn(playerPed)
    local allowed = CheckAllowed(source, "VehicleRelatedOptions_SpawnCustomVehicle")
    if allowed then
        if vehicle then
            DeleteEntity(vehicle)
        end
        Wait(100)
        TSSpawnVehicle(model or `baller2`, GetEntityCoords(playerPed), GetEntityHeading(playerPed), function(car)
            local timeout = 50
            repeat
                Wait(0)
                timeout = timeout - 1
                SetPedIntoVehicle(playerPed, car, -1)
            until GetVehiclePedIsIn(playerPed, false) ~= 0 or timeout < 1
        end)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:TruckPunchlinePly", function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Truck")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:TruckPunchline", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:ClownAttackPly", function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Clown")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:ClownAttack", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:MerryAttackPly", function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Merry")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:MerryAttack", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:FlashPly", function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Flash")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:FlashPly", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:LagGame", function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Lag")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:LagGame", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:BlowPly", function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_BlowTyre")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:BlowPly", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:EjectPly", function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Eject")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:EjectPly", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)

RegisterNetEvent("sho_adminmenu:server:Crashply", function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, "TrollMenu_Crash")
    if allowed then
        TriggerClientEvent("sho_adminmenu:troll:Crashply", yPlayer.source)
    else
        TriggerClientEvent("ox_lib:notify", xPlayer.source, {title = "Staff Menu", description = "You are not allowed to do this", type = "error"})
    end
end)