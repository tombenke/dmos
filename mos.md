Using the mos tool
==================

## Install firmware

- https://mongoose-os.com/software.html

```bash
    developer@229c435e583e:~$ mos flash mos-esp8266

    Fetching https://mongoose-os.com/downloads/mos-esp8266.zip...
    Loaded mjs_base/esp8266 version 1.0 (20170428-121030/???)
    Opening /dev/ttyUSB0...
    Connecting to ESP8266 ROM, attempt 1 of 10...
      Connected
    Running flasher @ 460800...
      Flasher is running
    Flash size: 4194304, params: 0x0240
    Deduping...
        2544 @ 0x0 -> 0
      632384 @ 0x8000 -> 0
      131072 @ 0xdb000 -> 8192
         128 @ 0x3fc000 -> 0
    Writing...
        4096 @ 0x1000
        8192 @ 0xec000
        4096 @ 0xfb000
    Wrote 16384 bytes in 0.38 seconds (336.93 KBit/sec)
    Verifying...
        2544 @ 0x0
        4096 @ 0x1000
      632384 @ 0x8000
      131072 @ 0xdb000
        4096 @ 0xfb000
         128 @ 0x3fc000
    Booting firmware...
    All done!
```

## Get RPC command list

```bash
    developer@229c435e583e:~$ mos call RPC.List 
    [
      "I2C.WriteRegW",
      "I2C.WriteRegB",
      "I2C.ReadRegW",
      "I2C.ReadRegB",
      "I2C.Write",
      "I2C.Read",
      "I2C.Scan",
      "GPIO.RemoveIntHandler",
      "GPIO.SetIntHandler",
      "GPIO.Toggle",
      "GPIO.Write",
      "GPIO.Read",
      "FS.Remove",
      "FS.Put",
      "FS.Get",
      "FS.ListExt",
      "FS.List",
      "Config.Save",
      "Config.Set",
      "Config.Get",
      "OTA.SetBootState",
      "OTA.GetBootState",
      "OTA.CreateSnapshot",
      "OTA.Revert",
      "OTA.Commit",
      "OTA.Update",
      "Sys.GetInfo",
      "Sys.Reboot",
      "RPC.Describe",
      "RPC.List"
    ]
```

## Get system information

```bash
    developer@229c435e583e:~$ mos call Sys.GetInfo
    {
      "app": "mjs_base",
      "fw_version": "1.0",
      "fw_id": "20170428-121030/???",
      "mac": "5ECF7F0D9A97",
      "arch": "esp8266",
      "uptime": 464,
      "ram_size": 51968,
      "ram_free": 38364,
      "ram_min_free": 34032,
      "fs_size": 113201,
      "fs_free": 47941,
      "wifi": {
        "sta_ip": "",
        "ap_ip": "192.168.4.1",
        "status": "",
        "ssid": ""
      }
    }
```

## Connect to the web server

First connect to the wifi network, provides by the default Access Point:

1. select the access point, such as `Mongoose_<random-number>`,
2. use the default password: `Mongoose`.

Open the following URL in a browser: `http://192.168.4.1`, then you should see something like this:

```
    Welcome to Mongoose OS

    Customize this file, index.html, to get a unique Web UI for your embedded application.
    Check out c_web_config example to see how to implement device configuration Web UI.
    For more details, check out documentation.
    Use curl to push new firmware: curl -v -F file=@build/fw.zip -F commit_timeout=60 http://IP_ADDR/update
    Use curl to pull new firmware: curl -v 'http://IP_ADDR/update?url=NEW_URL/fw-esp8266.zip&commit_timeout=120&ignore_same_version=0'
```

Try the RPC REST endpoint via getting the system information with the browser, or `curl`:

```bash
    $ curl http://192.168.4.1/rpc/Sys.GetInfo
    {"app": "mjs_base", "fw_version": "1.0", "fw_id": "20170428-121030/???", "mac": "5ECF7F0D9A97", "arch": "esp8266", "uptime": 1208, "ram_size": 51968, "ram_free": 37388, "ram_min_free": 34032, "fs_size": 113201, "fs_free": 47941,"wifi": {"sta_ip": "", "ap_ip": "192.168.4.1", "status": "", "ssid": ""}}
    
```
    

