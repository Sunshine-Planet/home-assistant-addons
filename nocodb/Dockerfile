# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH NOCO_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"
# Copy root filesystem
COPY rootfs /
RUN apk add --update nodejs npm jq git

RUN \
    git clone https://github.com/nocodb/nocodb-seed /nocodb-seed \
    && cd /nocodb-seed \
    && npm install

#ENV NC_DOCKER 0.6
ENV NODE_ENV production
ENV PORT 8080
ENV NC_TOOL_DIR=/data/