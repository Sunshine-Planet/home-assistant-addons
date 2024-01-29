# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"
# Copy root filesystem
COPY rootfs /

RUN \
    curl http://get.nocodb.com/linux-${BUILD_ARCH} -o nocodb -L && chmod +x nocodb && mv nocodb /usr/bin/nocodb

ENV PORT=8080
# provided by hass
ENV NC_TOOL_DIR=/data/  