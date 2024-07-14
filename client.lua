local cinematicMode = false

-- Function to toggle cinematic mode
function toggleCinematicMode()
    cinematicMode = not cinematicMode
    SendNUIMessage({
        type = 'setCinematicMode',
        state = cinematicMode
    })
    updateHUD()
    if cinematicMode then
        showNotification("Cinematic Mode Enabled")
    else
        showNotification("Cinematic Mode Disabled")
    end
end

-- Function to update HUD visibility
function updateHUD()
    if cinematicMode then
        -- Hide HUD elements
        DisplayRadar(false)
        TriggerEvent('hideHudComponents', {1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 19, 20})
    else
        -- Show HUD elements
        DisplayRadar(true)
        TriggerEvent('showHudComponents', {1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 19, 20})
    end
end

-- Function to show notification
function showNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, false)
end

-- Command to toggle cinematic mode
RegisterCommand('cinematic', function()
    toggleCinematicMode()
end, false)