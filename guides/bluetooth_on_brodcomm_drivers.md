# Get Bluetooth working on brodcomm drivers


So if you install the WiFi drivers, you will mostly have the bluetooth not working, to fix this follow these steps


`lsusb | grep Bluetooth`

you'll get:
`Bus 001 Device 004: ID 0a5c:21d7 Broadcom Corp. BCM43142 Bluetooth 4.0`

We nee the ID 0a5c:21d7 and BCM43142 bits

now do 
`dmesg | egrep -i 'blue|firm'`

and you'll probably get:

`bluetooth hci0: Direct firmware load for brcm/BCM.hcd failed with error -2`

so now clone this repo `https://github.com/winterheart/broadcom-bt-firmware`


in here goto the brcm folder and look for your driver: 

`BCM43142A0-0a5c-21d7.hcd` (notice how I constructed the name using the information from the ID and the chipset model number above)

copy this file to `/lib/firmware/brcm/BCD.hcd` 

> NOTE: In some cases when you run this you'll get the name of the actual driver that is missing, so just copy that directly don't rename it to BCD.hcd

Reboot and you should be done.

more info on `https://dev-pages.info/ubuntu-bluetooth/`
