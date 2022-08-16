RegisterNetEvent('esx_phonetax:showNotify')
AddEventHandler('esx_phonetax:showNotify', function(icon, msg, title, subtitle)

    showPictureNotification(icon, msg, title, subtitle)

end)


RegisterNetEvent('esx_phonetax:customNotify')
AddEventHandler('esx_phonetax:customNotify', function(title, message, time, type)

    if title == nil then 
        -- Your custom export (if you dont have a title in your notify script)
    else 
        -- Your custom export (if you you have a title in your nofity script) 
    end
end)


RegisterNetEvent('esx_phonetax:BillingUI')
AddEventHandler('esx_phonetax:BillingUI', function(PlayerId, price)

    if price == nil then
        TriggerServerEvent("billing_ui:sendBill", PlayerId, Config.Society, Config.BillReason, Config.PayAmount)
    else    
        TriggerServerEvent("billing_ui:sendBill", PlayerId, Config.Society, Config.BillReason, price)
    end

end)

RegisterNetEvent('esx_phonetax:esxBilling')
AddEventHandler('esx_phonetax:esxBilling', function(PlayerId, price)

    if price == nil then 
        TriggerServerEvent('esx_billing:sendBill', PlayerId, Config.Society, Config.BillReason, Config.PayAmount)
    else
        TriggerServerEvent('esx_billing:sendBill', PlayerId, Config.Society, Config.BillReason, price)
    end

end)


function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg);
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true);
end
