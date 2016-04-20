FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r05
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=ruby \
    BITNAMI_APP_VERSION=2.3.0-6 \
    BITNAMI_APP_CHECKSUM=e5b6da98d31971d35e272f52023f6c4548083188b75f1b0af0c02a3cdc1879be

# Install application
RUN bitnami-pkg install $BITNAMI_APP_NAME-$BITNAMI_APP_VERSION --checksum $BITNAMI_APP_CHECKSUM
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/common/bin:$PATH

# Setting entry point
COPY rootfs/ /
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["irb"]

# Exposing ports
EXPOSE 3000

WORKDIR /app
