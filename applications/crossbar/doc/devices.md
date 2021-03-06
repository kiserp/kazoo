/*
Section: Crossbar
Title: Devices
Language: en-US
Version: 3.20
*/

# Kazoo Devices
Learn how to use the 2600hz mobile API set to activate and manage phones.


## Static Presence ID

You can set a presence ID at the device level. By adding: `presence_id` field on your device document. This will fix any presence issue regarding inbound/outbound call on a cellphone device.

## QuickCall

Additional info for [QuickCall is on the wiki.](https://2600hz.atlassian.net/wiki/display/APIs/QuickCall+API)

```
http://{your kazoo domain}:8000/v1/accounts/{account_id}/devices/{device_id}/quickcall/{number_to_call}?auth_token={API key or Auth Token}&cid-number={caller ID number}&cid-name={caller ID name}
```

If you are using HTTPs don't forget to update the port as well!
```
https://{your kazoo domain}:8443/v1/accounts/{account_id}/devices/{device_id}/quickcall/{number_to_call}?auth_token={API key or Auth Token}&cid-number={caller ID number}&cid-name={caller ID name}
```

_Both cid-number and cid-name are optional_

Above are all the options of QuickCall (As Far as I can tell) They should be added to the examples.

Also under Resource Parameters add "cid-name" info to the "cid-number" info

esoare

## Sync

Some devices support receiving SIP NOTIFY packets with `event` = `check-sync`. This is typically used to reboot the phone if the configuration has changed. Kazoo will generate the NOTIFY packet if the device is registered.

    curl -v -X POST -H "X-Auth-Token:{AUTH_TOKEN}" http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}/sync
