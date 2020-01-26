FROM bitnami/ruby:2.7.0-debian-10-r1 as development

######

FROM bitnami/minideb:buster
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages ca-certificates curl ghostscript imagemagick libc6 libgmp-dev libncurses6 libreadline7 libssl1.1 libtinfo6 libxml2-dev libxslt1-dev procps sudo unzip zlib1g zlib1g-dev
RUN apt-get update && apt-get upgrade && \
    rm -r /var/lib/apt/lists /var/cache/apt/archives
RUN sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS    90/' /etc/login.defs && \
    sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS    0/' /etc/login.defs && \
    sed -i 's/sha512/sha512 minlen=8/' /etc/pam.d/common-password

COPY --from=development /opt/bitnami/ruby /opt/bitnami/ruby

ENV BITNAMI_APP_NAME="ruby" \
    BITNAMI_IMAGE_VERSION="2.7.0-debian-10-r1-prod" \
    PATH="/opt/bitnami/ruby/bin:$PATH"

CMD [ "irb" ]