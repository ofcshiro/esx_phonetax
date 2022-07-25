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
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. rprice .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                        xPlayer.removeInventoryItem(Config.ReplaceItem, amount)
                                        xPlayer.addInventoryItem(Config.ItemName, amount)
                                    else
                                        xPlayer.removeAccountMoney(Config.PlayerAccount, Config.PayAmount)
                                        if ramount > 1 then
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. rprice .. '$ ~s~für deine Handys bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                        else
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. price .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                        end
                                    end
                                else
                                    if ramount > 0 then
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. rprice .. '$ ~r~nicht ~s~Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung') 
                                    else
                                        xPlayer.removeInventoryItem(Config.ItemName, amount)
                                        xPlayer.addInventoryItem(Config.ReplaceItem, amount)
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. price .. '$~r~nicht ~s~Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung')
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
                                    TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. price .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                else
                                    xPlayer.removeAccountMoney('bank', price)
                                    TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. price .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
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
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. Config.PayAmount .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                            xPlayer.removeInventoryItem(Config.ReplaceItem, amount)
                                            xPlayer.addInventoryItem(Config.ItemName, amount)
                                        else
                                            xPlayer.removeAccountMoney(Config.PlayerAccount, Config.PayAmount)
                                            if amount > 1 then
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. Config.PayAmount .. '$ ~s~für deine Handys bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                            else
                                                TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. Config.PayAmount .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                            end
                                        end 
                                    else
                                        if ramount > 0 then
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. Config.PayAmount .. ' ~r~nicht ~s~Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung') 
                                        else
                                            xPlayer.removeInventoryItem(Config.ItemName, amount)
                                            xPlayer.addInventoryItem(Config.ReplaceItem, amount)
                                            TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du konntest deine Handy Gebühren: ' .. Config.PayAmount .. ' ~r~nicht ~s~Bezahlen', 'Handyrechnung', 'Gebühren und Versicherung')
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
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. Config.PayAmount .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
                                    else
                                        xPlayer.removeAccountMoney('bank', price)
                                        TriggerClientEvent('esx_phonetax:showNotify', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. Config.PayAmount .. '$ ~s~für dein Handy bezahlt', 'Handyrechnung', 'Gebühren und Versicherung')
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