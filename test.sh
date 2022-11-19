#!/bin/bash

export BUILD_FROM="homeassistant/amd64-base:latest"
docker build --build-arg BUILD_FROM=$BUILD_FROM -t cd-reader .