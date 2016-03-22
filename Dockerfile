FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r05
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=ruby \
    BITNAMI_APP_USER=bitnami \
    BITNAMI_APP_VERSION=2.3.0-1 \
    RUBY_PACKAGE_SHA256="05cc9a1d740418633c6a83038e62c3287270bdc1bb16a78a0810f105ee938812"

ENV BITNAMI_APP_DIR=/opt/bitnami/$BITNAMI_APP_NAME

ENV PATH=$BITNAMI_APP_DIR/bin:/opt/bitnami/common/bin:$PATH

RUN bitnami-pkg install $BITNAMI_APP_NAME-$BITNAMI_APP_VERSION

COPY rootfs/ /

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["irb"]
