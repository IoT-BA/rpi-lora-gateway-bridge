# rpi-lora-gateway-bridge
## LoRa Gateway Bridge
Docker image of [lora-gateway-bridge](https://github.com/brocaar/lora-gateway-bridge) to be run on Raspberry 3 based LoRaWAN gateway. More info about gateways can be found at [Gateway wiki](https://github.com/IoT-BA/project_noe-gateway/wiki/LoRaWAN-Gateway)


### Build image
    sudo docker build -t lora-gateway-bridge:beta -f Dockerfile-gateway_bridge .

### Test-Run container
    sudo docker run --name gateway-bridge -e MQTT_SERVER=tcp:/#MQTT_IP:#MQTT_PORT -it lora-gateway-bridge:beta

### Daemon-Run container
    sudo docker run --name gateway-bridge lora-gateway-bridge:beta

