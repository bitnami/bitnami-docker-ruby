## BUILDING
##   (from project root directory)
##   $ docker build -t ruby-for-bitnami-bitnami-docker-ruby .
##
## RUNNING
##   $ docker run -p 3000:3000 ruby-for-bitnami-bitnami-docker-ruby
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="aq2un49" \
    STACKSMITH_STACK_NAME="Ruby for bitnami/bitnami-docker-ruby" \
    STACKSMITH_STACK_PRIVATE="1"

# System packages required
RUN install_packages libc6 libssl1.0.0 zlib1g libreadline6 libncurses5 libtinfo5 libffi6 libxml2-dev zlib1g-dev libxslt1-dev libgmp-dev ghostscript imagemagick libmysqlclient18 libpq5

RUN bitnami-pkg unpack ruby-2.4.0-0 --checksum 189d7da38f702086231ddf371b41ddc8b29382147522d7dad399bbdb7944d958

COPY rootfs /

ENV PATH=/opt/bitnami/ruby/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

ENV BITNAMI_APP_NAME=ruby \
    BITNAMI_IMAGE_VERSION=2.4.0-r0

EXPOSE 3000
WORKDIR /app

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["irb"]
