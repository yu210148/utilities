To allow a new device to connect to the rpi via bluetooth do:

pair the device to get the mac address of the device on the rpi

```ssh <pi ip address>```

then:

```sudo bluetoothctl```

```# trust xx:xx:xx:xx:xx:xx (device's bluetooth mac)```

then try the connection on the device

2016-08-20 --KL
