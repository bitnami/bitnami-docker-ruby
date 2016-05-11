FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r06
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_IMAGE_VERSION=2.3.1-r0 \
    BITNAMI_APP_NAME=ruby

RUN bitnami-pkg install ruby-2.3.1-1 --checksum a81395976c85e8b7c8da3c1db6385d0e909bd05d9a3c1527f8fa36b8eb093d84
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/common/bin:$PATH

CMD ["irb"]

WORKDIR /app

EXPOSE 3000
