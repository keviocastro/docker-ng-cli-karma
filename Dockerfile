FROM trion/ng-cli:alpine

MAINTAINER trion development GmbH "info@trion.de"

USER root

ADD launch-chromium /usr/bin/launch-chromium

# TODD: add https://pkgs.alpinelinux.org/package/edge/community/x86_64/chromium

RUN set -xe \
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk add -U --no-cache \
      udev \
      ttf-opensans \
      chromium \
 && rm -f /usr/bin/chromium-browser /usr/bin/google-chrome \
 && ln -s /usr/bin/launch-chromium /usr/bin/google-chrome \
 && ln -s /usr/bin/launch-chromium /usr/bin/chromium-browser \
 && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/* \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html

# RUN set -xe \
#  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
#  && apk add -U --no-cache \
#       udev \
#       ttf-opensans \
#       mesa-dri-swrast \
#       udev \
#       mesa-dev mesa-gles \
#       chromium \
#  && rm -f /usr/bin/chromium-browser /usr/bin/google-chrome \
#  && ln -s /usr/bin/launch-chromium /usr/bin/google-chrome \
#  && ln -s /usr/bin/launch-chromium /usr/bin/chromium-browser \
#  && mkdir /usr/lib/chromium/swiftshader/ \
#  && ln -s /usr/lib/libGLESv2.so /usr/lib/chromium/swiftshader/libGLESv2.so \
#  && rm -rf /var/lib/apt/lists/* \
#     /var/cache/apk/* \
#     /usr/share/man \
#     /tmp/* \
#     /usr/lib/node_modules/npm/man \
#     /usr/lib/node_modules/npm/doc \
#     /usr/lib/node_modules/npm/html


USER $USER_ID
