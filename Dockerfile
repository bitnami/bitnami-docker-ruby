FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r06
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=ruby \
    BITNAMI_APP_VERSION=2.3.1-0 \
    BITNAMI_APP_CHECKSUM=b0398dceb2929572a7cbad61de9fe13ac92835eecbf7f2e5ef7cbc35dfa7c327

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
