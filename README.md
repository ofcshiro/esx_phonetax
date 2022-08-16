# ESX Phonetax

## Description

Its a script where you can setup tax for players who owns a phone.
in the config.lua is most of the stuff already configurable. 

By default it comes with the "auto" Billing Mode which is made
if you neither use esx_billing nor Billing UI. 

Auto mode basically takes the money from the player from either money, black_money or bank 
depending on the setting in config.lua

It comes with Support for:

esx_billing (comes with ESX by default) 
BillingUI (Paid resource from Jaksam) 

## Getting Started

### Requirements

* ESX Legacy Version 1.3 or higher (Latest highly recommended!)
https://github.com/esx-framework/esx-legacy

### Optionals

* Billing UI - If you want to use Jaksams Billing UI
* esx_billing - If you want to use default ESX Billing

### Installing

* Download the Script and copy it in your resource folder
* Import the .sql file in your Database if you want to use "ReplacePhone"
* Open the Config.lua and setup everything the way you want it to be
* put ensure esx_phonetax in your server.cfg

## Version History

* 1.5
    * Custom Notify Support

* 1.0
    * Initial Release

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE.md file for details

## Acknowledgments

Inspiration, picture notify code
* [Luis-spec](https://github.com/Luis-spec) - He has a video on his Youtube for a very simplified version that i took as inspiration for this one.
