# raspberry-pi-wireless-bootstrap

Ever wanted to set up a Raspberry Pi without a screen, nor a router to plug it into?

This utility allows you to flash an SD card with an OS image, which will span a WiFi hotspot when booted with a Raspberry Pi.
You can then connect to this Wifi hotspot and reach the Raspberry Pi via SSH:

```sh
ssh pi@10.42.0.1
```

Currently, the image being flashed is hard-coded to be `Raspberry Pi OS Lite (64-bit)`.


## Hardware Support

Tested to work with:
* Raspberry Pi 3B+
* Raspberry Pi 4B

Does not work with:
* Raspberry Pi 3B (WiFi hotspot appears, but cannot connect to it)


## Development

You can build a release by running `.ci/create_release.sh`.
You may want to increment the version number in the script before you do so.
