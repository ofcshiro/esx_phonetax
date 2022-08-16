Config = {}

-- General Options
Config.PayPerPhone = false              -- if the tax is depended on the amount of phones or not 
Config.ItemName = 'phone'               -- the Itemname, you can replace it if your phone is named 'handy' for example
Config.NotifyType = 'picture'           -- Available Options: 'custom' and 'picture'

-- Price and Time Options
Config.PayAmount = 120                  -- the amount of money to pay per phone
Config.TaxTime = 60 * 60000             -- The Payment interval of the Tax (60 * 60000 = 1 Hour)

-- Billing Settings
Config.BillingMethod = 'auto'           -- Available options: 'auto', 'esx_billing', 'billingui' (explanation at the bottom of the file)
Config.Society = 'society_unemployed'   -- The Society that gets the money from paid bills (only works with esx_billing and Billing UI)
Config.BillReason = 'Handyrechnung'     -- The Reason from the Bill

Config.PlayerAccount = 'money'          -- The Account that is used for the 'auto' payment ('money', 'bank', 'black_money')

-- Config Items

Config.ReplacePhone = true              -- Should the Phone(s) replaced by another Item if the player cant pay for it (Only works with Config.BillingMethod = 'auto')
Config.ReplaceItem = 'dphone'           -- The Item that gets replaces the phone




--[[

Explanation for Config.BillingMethod

-------------------------------------------------------
'auto' (takes money automaticly)

Features available if you use 'auto': 
- Config.ReplacePhone
- Config.ReplaceItem

Features that cant be used with 'auto': 
- Config.Society

------------------------------------------------------
'esx_billing' (sends a bill to the player)


Features available if you use 'esx_billing':
- Config.Society

Features that cant be used with 'esx_billing':
- Config.ReplacePhone
- Config.ReplaceItem

------------------------------------------------------
'billingui' (sends a bill through Jaksams Billing UI)

Features available if you use 'billing_ui':
- Config.Society

Features that cant be used with 'billingui':
- Config.ReplacePhone
- Config.ReplaceItem

--]]
