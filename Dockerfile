FROM nforceroh/docker-dotnetcore-arch:latest

MAINTAINER Sylvain Martin (sylvain@nforcer.com)

#ARG EMBY_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/4.1.0.8/embyserver-netcore_4.1.0.8.zip"

RUN \
 echo "Installing Emby and dependancies" \
 && pacman --noconfirm -Syu \
 && pacman --noconfirm -Sy unzip skia-sharp60 imagemagick libmagick sqlite libglvnd emby-server \
# && curl -L -s ${EMBY_URL} -o /tmp/emby.zip \
# && unzip /tmp/emby.zip -d /app \
# && cd /app/system \
  && ln -s /usr/lib/emby-server /app/system \
  && ln -s /usr/bin/ffprobe-emby /usr/lib/emby-server/ffprobe \
  && ln -s /usr/bin/ffmpeg-emby /usr/lib/emby-server/ffmpeg \
# && ln -s /usr/lib/libSkiaSharp.so.60.0.0 libSkiaSharp.so \
# && rm -f /tmp/emby.zip \
 && rm -rf /usr/share/man/* /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /etc/pacman.d/mirrorlist.pacnew

##
## INIT
##

COPY rootfs/ /

ENTRYPOINT [ "/init" ]
