FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r05
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=ruby \
    BITNAMI_APP_VERSION=2.3.0-1 \
    BITNAMI_APP_CHECKSUM=05cc9a1d740418633c6a83038e62c3287270bdc1bb16a78a0810f105ee938812

# Install application
RUN bitnami-pkg install $BITNAMI_APP_NAME-$BITNAMI_APP_VERSION --checksum $BITNAMI_APP_CHECKSUM
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/common/bin:$PATH

# Setting entry point
COPY rootfs/ /
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["irb"]

WORKDIR /app

# Exposing ports
EXPOSE 3000
