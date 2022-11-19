ARG BUILD_FROM
FROM $BUILD_FROM

#RUN   apk update \                                        
#      &&   apk add ca-certificates wget \
#      &&   update-ca-certificates

RUN  set -x \
  \
  && apk add --no-cache --virtual deps \
      build-base \
      curl \
      libxml2-dev \
      linux-headers \
      perl-dev \
      perl-utils \
  && apk add --no-cache \
      abcde \
      cdparanoia \
      flac \
      lame \
      less \
      libcddb \
      libxml2 \
      mutagen \
      perl \
      python3 \
      py3-pip 

RUN pip3 install -U \
    eyed3 \
    pylast==2.4.0 
  
RUN curl -SLo /tmp/libdiscid.tar.gz http://ftp.musicbrainz.org/pub/musicbrainz/libdiscid/libdiscid-0.6.2.tar.gz \
  && cd /tmp \
  && tar xvf libdiscid.tar.gz \
  && cd libdiscid-0.6.2 \
  && ./configure \
  && make \
  && make install 

RUN perl -MCPAN -e 'install (IO::Socket::SSL) >= 2.009' \
  &&  perl -MCPAN -e 'install (XML::LibXML)' \
  &&  perl -MCPAN -e 'install (YAML)' \
  &&  perl -MCPAN -e 'install (WebService::MusicBrainz)' \
  &&  perl -MCPAN -e 'install (MusicBrainz::DiscID)' \
  &&  perl -MCPAN -e 'install (MusicBrainz)' \
  && apk del deps
  

      
RUN  mkdir -p /media/music 

# Copy data for add-on
COPY run.sh /
RUN chmod a+x run.sh

COPY abcde.conf /etc/abcde.conf


CMD [ "/run.sh" ]