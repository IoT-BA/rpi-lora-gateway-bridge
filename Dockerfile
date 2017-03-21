FROM resin/rpi-raspbian:latest
RUN apt-get -y update
RUN apt-get -y install \
	wget

RUN useradd -M -r -s /bin/false gatewaybridge

# download precompiled binaries
RUN wget https://github.com/brocaar/lora-gateway-bridge/releases/download/2.1.3/lora_gateway_bridge_2.1.3_linux_arm.tar.gz

# unpack
RUN ["tar", "zxf", "lora_gateway_bridge_2.1.3_linux_arm.tar.gz"]
ENV LORA_GATEWAY_BRIDGE_VERSION 2.1.3
# move the binary to /opt/lora-gateway-bridge/bin
RUN mkdir -p /opt/lora-gateway-bridge/bin
RUN mv lora-gateway-bridge /opt/lora-gateway-bridge/bin

#gateway bridge
WORKDIR /opt/lora-gateway-bridge/bin
USER gatewaybridge
EXPOSE 11680/udp
CMD ["./lora-gateway-bridge"]

