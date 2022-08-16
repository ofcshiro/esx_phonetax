Citizen.CreateThread(function()

    while true do
        Wait(0) 
        for k, PlayerId in pairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(PlayerId)
        local Item = xPlayer.getInventoryItem(Config.ItemName)
        local RItem = xPlayer.getInventoryItem(Config.ReplaceItem)
        
            if Item ~= nil or RItem ~= nil then 
                local amount = xPlayer.getInventoryItem(Config.ItemName).count
                local ramount = xPlayer.getInventoryItem(Config.ReplaceItem).count
                if Config.PayPerPhone then 
                    local price = amount * Config.PayAmount
                    local rprice = ramount * Config.PayAmount
                    if amount > 0 or ramount > 0 then 
                        local Money = xPlayer.getAccount(Config.PlayerAccount).money
                        if Config.ReplacePhone then 
                            if Config.BillingMethod == 'auto' then 
                                if Money >= Config.PayAmount then 
                                    if amount == 0 and ramount > 0 then
                                        local amount = xPlayer.getInventoryItem(Config.ReplaceItem).count
                                        xPlayer.removeAccountMoney(Config.PlayerAccount, rprice)
                                        xPlayer.removeInventoryItem(Config.ReplaceItem, amount)
                                        xPlayer.addInventoryItem(Config.ItemName, amount)

                                        if Config.NotifyType == 'picture' then 
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. rprice .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                        elseif Config.NotifyType == 'custom' then
                                            TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. rprice .. '$ für dein Handy bezahlt', 5000, 'info')
                                        end
                                    else
                                        xPlayer.removeAccountMoney(Config.PlayerAccount, Config.PayAmount)
                                        if Config.NotifyType == 'picture' then 
                                            if ramount > 1 then
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. rprice .. '$ für deine Handys bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                            else
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. price .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                            end
                                        elseif Config.NotifyType == 'custom' then
                                            if ramount > 1 then 
                                                TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. rprice .. '$ für deine Handys bezahlt', 5000, 'info')
                                            else
                                                TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. price .. '$ für dein Handy bezahlt', 5000, 'info') 
                                            end
                                        end
                                    end
                                else
                                    if ramount > 0 then
                                        if Config.NotifyType == 'picture' then
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. rprice .. '$ nicht Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung') 
                                        elseif Config.NotifyType == 'custom' then 
                                            TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du konntest deine Handy Gebühren: ' .. rprice .. '$ nicht Bezahlen', 5000, 'info') 
                                        end
                                    else
                                        xPlayer.removeInventoryItem(Config.ItemName, amount)
                                        xPlayer.addInventoryItem(Config.ReplaceItem, amount)
                                        
                                        if Config.NotifyType == 'picture' then 
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. price .. '$ nicht Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung')
                                        elseif Config.NotifyType == 'custom' then 
                                            TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du konntest deine Handy Gebühren: ' .. price .. '$ nicht Bezahlen', 5000, 'info') 
                                        end
                                    end
                                end
                            elseif Config.BillingMethod == 'esx_billing' then
                                -- Code for esx_billing
                                TriggerClientEvent('esx_phonetax:esxBilling', PlayerId, PlayerId, price)
                            elseif Config.BillingMethod == 'billingui' then
                                -- Code for Jaksam Billing UI
                                TriggerClientEvent('esx_phonetax:BillingUI', PlayerId, PlayerId, price)
                            end
                        else
                            if Config.BillingMethod == 'auto' then 
                                if Money >= Config.PayAmount then
                                    xPlayer.removeAccountMoney(Config.PlayerAccount, price)

                                    if Config.NofityType == 'picture' then 
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. price .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                    elseif Config.NotifyType == 'custom' then
                                        TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. price .. '$ für dein Handy bezahlt', 5000, 'info')                                     
                                    end
                                else
                                    xPlayer.removeAccountMoney('bank', price)

                                    if Config.NotifyType == 'picture' then
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. price .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                    elseif Config.NotifyType == 'custom' then 
                                        TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. price .. '$ für dein Handy bezahlt', 5000, 'info') 
                                
                                    end
                                end
                            elseif Config.BillingMethod == 'esx_billing' then
                                -- Code for esx_billing
                                TriggerClientEvent('esx_phonetax:esxBilling', PlayerId, PlayerId, price)
                            elseif Config.BillingMethod == 'billingui' then
                                -- Code for Jaksam Billing UI
                                TriggerClientEvent('esx_phonetax:BillingUI', PlayerId, PlayerId, price)
                            end
                        end
                    end       
                else
                    if amount > 0 or ramount > 0 then 
                        local Money = xPlayer.getAccount(Config.PlayerAccount).money
                            if Config.ReplacePhone then
                                if Config.BillingMethod == 'auto' then
                                    if Money >= Config.PayAmount then
                                        if amount == 0 and ramount > 0 then
                                            local amount = xPlayer.getInventoryItem(Config.ReplaceItem).count
                                            xPlayer.removeAccountMoney(Config.PlayerAccount, Config.PayAmount)
                                            xPlayer.removeInventoryItem(Config.ReplaceItem, amount)
                                            xPlayer.addInventoryItem(Config.ItemName, amount)
                                            
                                            if Config.NotifyType == 'picture' then 
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. rprice .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                            elseif Config.NotifyType == 'custom' then
                                                TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. rprice .. '$ für dein Handy bezahlt', 5000, 'info')
                                            end
                                        else
                                            xPlayer.removeAccountMoney(Config.PlayerAccount, Config.PayAmount)

                                            if amount > 1 then
                                                if Config.NotifyType == 'picture' then 
                                                    TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. Config.PayAmount .. '$ für deine Handys bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                                elseif Config.NotifyType == 'custom' then 
                                                    TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. Config.PayAmount .. '$ für dein Handys bezahlt', 5000, 'info')
                                                end
                                            else
                                                if Config.NofityType == 'picture' then 
                                                    TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. Config.PayAmount .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                                elseif Config.NotifyType == 'custom' then 
                                                    TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. Config.PayAmount .. '$ für dein Handy bezahlt', 5000, 'info')
                                                end
                                            end
                                        end 
                                    else
                                        if ramount > 0 then
                                            if Config.NotifyType == 'picture' then     
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. Config.PayAmount .. ' nicht Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung') 
                                            elseif Config.NotifyType == 'custom' then 
                                                TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du konntest deine Handy Gebühren: ' .. Config.PayAmount .. ' nicht Bezahlen', 5000, 'info')
                                            end
                                        else
                                            xPlayer.removeInventoryItem(Config.ItemName, amount)
                                            xPlayer.addInventoryItem(Config.ReplaceItem, amount)

                                            if Config.NotifyType == 'picture' then
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. Config.PayAmount .. ' nicht Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung')
                                            elseif Config.NotifyType == 'custom' then
                                                TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du konntest deine Handy Gebühren: ' .. Config.PayAmount .. ' nicht Bezahlen', 5000, 'info')
                                            end
                                        end
                                    end
                                
                                elseif Config.BillingMethod == 'esx_billing' then
                                    -- Code for esx_billing
                                    TriggerClientEvent('esx_phonetax:esxBilling', PlayerId, PlayerId)
                                elseif Config.BillingMethod == 'billingui' then
                                    -- Code for Jaksam Billing UI
                                    TriggerClientEvent('esx_phonetax:BillingUI', PlayerId, PlayerId)
                                end
                            else
                                if Config.BillingMethod == 'auto' then 
                                    if Money >= Config.PayAmount then
                                        xPlayer.removeAccountMoney(Config.PlayerAccount, Config.PayAmount)

                                        if Config.NotifyType == 'picture' then
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. Config.PayAmount .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                        elseif Config.NotifyType == 'custom' then
                                            TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. Config.PayAmount .. '$ für dein Handy bezahlt', 5000, 'info')
                                        end
                                    else
                                        xPlayer.removeAccountMoney('bank', price)
                                        if Config.NotifyType == 'picture' then
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ' .. Config.PayAmount .. '$ für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                        elseif Config.NotifyType == 'custom' then
                                            TriggerClientEvent('esx_phonetax:customNotify', xPlayer.source, Config.BillReason, 'Du hast ' .. Config.PayAmount .. '$ für dein Handy bezahlt', 5000, 'info')
                                        end
                                    end
                                
                                elseif Config.BillingMethod == 'esx_billing' then
                                    -- Code for esx_billing
                                    TriggerClientEvent('esx_phonetax:esxBilling', PlayerId, PlayerId)
                                elseif Config.BillingMethod == 'billingui' then
                                    -- Code for Jaksam Billing UI
                                    TriggerClientEvent('esx_phonetax:BillingUI', PlayerId, PlayerId)
                                end
                            end
                        end
                    end
                end
            end
        Wait(Config.TaxTime)
    end
end)
