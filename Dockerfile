FROM nforceroh/docker-arch-base:latest

MAINTAINER Sylvain Martin (sylvain@nforcer.com)

RUN \
 echo "Installing Emby and dependancies" \
 && pacman --noconfirm -Syu \
# && pacman --noconfirm -Sy unzip skia-sharp60 imagemagick libmagick sqlite libglvnd emby-server x264 x265 coreutils dotnet-runtime  \
 && pacman --noconfirm -Sy dotnet-runtime emby-server \
 && ln -s /usr/lib/emby-server /app/system \
 && ln -s /usr/bin/ffprobe-emby /usr/lib/emby-server/ffprobe \
 && ln -s /usr/bin/ffmpeg-emby /usr/lib/emby-server/ffmpeg \
 && rm -rf /usr/share/man/* /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /etc/pacman.d/mirrorlist.pacnew

##
## INIT
##

COPY rootfs/ /

ENTRYPOINT [ "/init" ]
