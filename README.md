# raspberry-pi-wireless-bootstrap

Ever wanted to set up a Raspberry Pi without a screen, nor a router to plug it into?

This utility allows you to flash an SD card with an OS image, which will span a WiFi hotspot when booted with a Raspberry Pi.
You can then connect to this Wifi hotspot and reach the Raspberry Pi via SSH.

Currently, the image being flashed is hard-coded to be `Raspberry Pi OS Lite (64-bit)`.


## Usage

1. Insert an SD card into your PC (you can use a USB adapter, if you don't have a hardware slot).
2. Flash the SD card via the CLI. Here's an example call:
   ```sh
   ./raspberry_pi_wireless_bootstrap --storage=/dev/mmcblk0 --wifi-country=DE --wifi-name=my-opendut-pi-01
   ```
   Use `--help` for additional information.
3. Put the SD card into a supported Raspberry Pi and power it on.
4. After it has booted, connect to its WiFi hotspot.
5. Log into the Raspberry Pi via SSH like so:
   ```sh
   ssh pi@10.42.0.1
   ```
6. Configure the Raspberry Pi, so that you can login without the hotspot. Then run `/opt/raspberry-pi-wireless-bootstrap-complete.sh` to disable the WiFi hotspot.


## Hardware Support

Tested to work with:
* Raspberry Pi 3B+
* Raspberry Pi 4B

Does not work with:
* Raspberry Pi 3B (WiFi hotspot appears, but cannot connect to it)
