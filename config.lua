Config = {}

-- General Options
Config.PayPerPhone = false               -- if the tax is depended on the phone or not 
Config.ItemName = 'phone'               -- the Itemname, you can replace it if your phone is named 'handy' for example

-- Price and Time Options
Config.PayAmount = 120                  -- the amount of money to pay per phone
--Config.TaxTime = 60 * 60000             -- The Payment interval of the Tax (60 * 60000 = 1 Hour)
Config.TaxTime = 1 * 10000
-- Billing Settings
Config.BillingMethod = 'auto'           -- Available Options: 'auto' (takes money automaticly), 'esx_billing' (sends a bill to the player), 'billingui' (sends a bill through Jaksams Billing UI)
Config.Society = 'society_unemployed'   -- The Society that gets the money from paid bills (only works with esx_billing and Billing UI)
Config.BillReason = 'Handyrechnung'     -- The Reason from the Bill

Config.PlayerAccount = 'money'          -- The Account that is used for the 'auto' payment ('money', 'bank', 'black_money')

-- Config Items

Config.ReplacePhone = true              -- Should the Phone(s) replaced by another Item if the player cant pay for it (Only works with Config.BillingMethod = 'auto')
Config.ReplaceItem = 'dphone'           -- The Item that gets replaces the phone 

