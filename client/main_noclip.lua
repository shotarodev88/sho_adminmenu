local MOVE_UP_KEY = 20
local MOVE_DOWN_KEY = 44
local CHANGE_SPEED_KEY = 21
local MOVE_LEFT_RIGHT = 30
local MOVE_UP_DOWN = 31
local NO_CLIP_NORMAL_SPEED = 0.5
local NO_CLIP_FAST_SPEED = 0.1

local index = 1

local Speeds = {
    {speed = 0.1, label = "Very Slow"},
    {speed = 0.5, label = "Slow"},
    {speed = 2, label = "Normal"},
    {speed = 5, label = "Fast"},
    {speed = 10, label = "Very Fast"},
    {speed = 15, label = "Max Speed"},
}

ENABLE_TOGGLE_NO_CLIP = true
ENABLE_NO_CLIP_SOUND = true

local eps = 0.01

local isNoClipping = false
local playerPed = PlayerPedId()
local playerId = PlayerId()
local speed = NO_CLIP_NORMAL_SPEED
local input = vector3(0, 0, 0)
local previousVelocity = vector3(0, 0, 0)
local breakSpeed = 10.0;
local offset = vector3(0, 0, 1);

local noClippingEntity = playerPed;

function ToggleNoClipMode()
    return SetNoClip(not isNoClipping)
end

function IsControlAlwaysPressed(inputGroup, control)
    return IsControlPressed(inputGroup, control) or IsDisabledControlPressed(inputGroup, control)
end

function IsControlAlwaysJustPressed(inputGroup, control)
    return IsControlJustPressed(inputGroup, control) or IsDisabledControlJustPressed(inputGroup, control)
end

function Lerp (a, b, t)
    return a + (b - a)*t
end

function IsPedDrivingVehicle(ped, veh)
    return ped == GetPedInVehicleSeat(veh, -1);
end

function SetInvincible(val, id)
    SetEntityInvincible(id, val)
    return SetPlayerInvincible(id, val)
end

function SetNoClip(val)
    playerPed = PlayerPedId()
    if (isNoClipping ~= val) then
        noClippingEntity = playerPed;
        if IsPedInAnyVehicle(playerPed, false) then
            local veh = GetVehiclePedIsIn(playerPed, false);
            if IsPedDrivingVehicle(playerPed, veh) then
                noClippingEntity = veh;
            end
        end
        local isVeh = IsEntityAVehicle(noClippingEntity);
        isNoClipping = val;
        if ENABLE_NO_CLIP_SOUND then
            if isNoClipping then
                PlaySoundFromEntity(-1, "SELECT", playerPed, "HUD_LIQUOR_STORE_SOUNDSET", 0, 0)
            else
                PlaySoundFromEntity(-1, "CANCEL", playerPed, "HUD_LIQUOR_STORE_SOUNDSET", 0, 0)
            end
        end
        SetUserRadioControlEnabled(not isNoClipping);
        if (isNoClipping) then
            SetEntityAlpha(noClippingEntity, 51, 0)
            lib.showTextUI("LEFT SHIFT - GO IN CURRENT SPEED  \nH - CHANGE SPEED  \nCurrent Speed - "..Speeds[index].label, {position = "right-center"})
            Citizen.CreateThread(function()
                local clipped = noClippingEntity
                local pPed = playerPed;
                local isClippedVeh = isVeh;
                SetInvincible(true, clipped);
                if not isClippedVeh then
                    ClearPedTasksImmediately(pPed)
                end
                while isNoClipping do
                    Citizen.Wait(0);
                    FreezeEntityPosition(clipped, true);
                    SetEntityCollision(clipped, false, false);
                    SetEntityVisible(clipped, false, false);
                    SetLocalPlayerVisibleLocally(true);
                    SetEntityAlpha(clipped, 51, false)
                    SetEveryoneIgnorePlayer(pPed, true);
                    SetPoliceIgnorePlayer(pPed, true);
                    if IsControlJustPressed(0, 74) then
                        if index ~= #Speeds then
                            lib.hideTextUI()
                            index = index+1
                            NO_CLIP_FAST_SPEED = Speeds[index].speed
                            lib.showTextUI("LEFT SHIFT - GO IN CURRENT SPEED  \nH - CHANGE SPEED  \nCurrent Speed - "..Speeds[index].label, {position = "right-center"})
                        else
                            lib.hideTextUI()
                            NO_CLIP_FAST_SPEED = Speeds[1].speed
                            lib.showTextUI("LEFT SHIFT - GO IN CURRENT SPEED  \nH - CHANGE SPEED  \nCurrent Speed - "..Speeds[index].label, {position = "right-center"})
                            index = 1
                        end
                    end
                    input = vector3(GetControlNormal(0, MOVE_LEFT_RIGHT), GetControlNormal(0, MOVE_UP_DOWN), (IsControlAlwaysPressed(1, MOVE_UP_KEY) and 1) or ((IsControlAlwaysPressed(1, MOVE_DOWN_KEY) and -1) or 0))
                    speed = ((IsControlAlwaysPressed(1, CHANGE_SPEED_KEY) and NO_CLIP_FAST_SPEED) or NO_CLIP_NORMAL_SPEED) * ((isClippedVeh and 2.75) or 1)
                    MoveInNoClip();
                end
                Citizen.Wait(0);
                FreezeEntityPosition(clipped, false);
                SetEntityCollision(clipped, true, true);
                SetEntityVisible(clipped, true, false);
                SetLocalPlayerVisibleLocally(true);
                ResetEntityAlpha(clipped);
                SetEveryoneIgnorePlayer(pPed, false);
                SetPoliceIgnorePlayer(pPed, false);
                ResetEntityAlpha(clipped);
                Citizen.Wait(500);
                if isClippedVeh then
                    while (not IsVehicleOnAllWheels(clipped)) and not isNoClipping do
                        Citizen.Wait(0);
                    end
                    while not isNoClipping do
                        Citizen.Wait(0);
                        if IsVehicleOnAllWheels(clipped) then
                            return SetInvincible(false, clipped);
                        end
                    end
                else
                    if (IsPedFalling(clipped) and math.abs(1 - GetEntityHeightAboveGround(clipped)) > eps) then
                        while (IsPedStopped(clipped) or not IsPedFalling(clipped)) and not isNoClipping do
                            Citizen.Wait(0);
                        end
                    end
                    while not isNoClipping do
                        Citizen.Wait(0);
                        if (not IsPedFalling(clipped)) and (not IsPedRagdoll(clipped)) then
                            return SetInvincible(false, clipped);
                        end
                    end
                end
            end)
        else
            ResetEntityAlpha(noClippingEntity)
            lib.hideTextUI()
        end
    end
end

function MoveInNoClip()
    SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
    local forward, right, up, c = GetEntityMatrix(noClippingEntity);
    previousVelocity = Lerp(previousVelocity, (((right*input.x*speed) + (up*-input.z*speed) + (forward*-input.y*speed))), Timestep()*breakSpeed);
    c = c + previousVelocity
    SetEntityCoordsNoOffset(noClippingEntity, c, true, true, false)
end

function MoveCarInNoClip()
    SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
    local forward, right, up, c = GetEntityMatrix(noClippingEntity);
    previousVelocity = Lerp(previousVelocity, (((right*input.x*speed) + (up*-input.z*speed) + (forward*-input.y*speed))), Timestep()*breakSpeed);
    c = c + previousVelocity
    SetEntityCoords(noClippingEntity, (c - offset) + (vec(0, 0, .3)), true, true, true, false)
end

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == RESSOURCE_NAME then
        SetNoClip(false);
        FreezeEntityPosition(noClippingEntity, false);
        SetEntityCollision(noClippingEntity, true, true);
        SetEntityVisible(noClippingEntity, true, false);
        SetLocalPlayerVisibleLocally(true);
        ResetEntityAlpha(noClippingEntity);
        SetEveryoneIgnorePlayer(playerPed, false);
        SetPoliceIgnorePlayer(playerPed, false);
        ResetEntityAlpha(noClippingEntity);
        SetInvincible(false, noClippingEntity);
    end
end)