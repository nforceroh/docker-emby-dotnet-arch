FROM nforceroh/docker-dotnetcore-arch:latest

MAINTAINER Sylvain Martin (sylvain@nforcer.com)

ARG EMBY_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/3.5.3.0/embyserver-netcore_3.5.3.0.zip"

RUN \
 echo "Fetching .Net Core" \
 && pacman --noconfirm -Syu \
 && pacman --noconfirm -Sy unzip skia-sharp ffmpeg imagemagick libmagick sqlite libglvnd \
 && curl -L -s ${EMBY_URL} -o /tmp/emby.zip \
 && unzip /tmp/emby.zip -d /app \
 && cd /app/system \
 && ln -s /usr/lib/libSkiaSharp.so libSkiaSharp.so \
 && rm -f /tmp/emby.zip \
 && rm -rf /usr/share/man/* /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /etc/pacman.d/mirrorlist.pacnew

##
## INIT
##

COPY rootfs/ /

ENTRYPOINT [ "/init" ]
