#!/bin/bash

export BUILD_FROM="homeassistant/amd64-base:latest"
docker build -t cd-reader .