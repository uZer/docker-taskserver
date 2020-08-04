FROM alpine

ARG APP_NAME="taskserver"
ARG APP_DESCRIPTION="A lightweight Alpine Taskwarrior server container"
ARG APP_VCS_REF
ARG APP_VCS_URL="https://github.com/GothenburgBitFactory/taskserver.git"
ARG APP_VERSION
ARG BUILD_DATE
ARG BUILD_VCS_REF
ARG BUILD_VCS_URL="https://github.com/uZer/docker-taskserver"

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.description=$APP_DESCRIPTION \
      org.label-schema.name=$APP_NAME \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url=$BUILD_REPO \
      org.label-schema.vcs-ref=$APP_VCS_REF \
      org.label-schema.vcs-url=$APP_VCS_URL \
      org.label-schema.version=$APP_VERSION

WORKDIR /app
RUN set -x \
      && apk add --update taskd \
      && rm -rf /var/cache/apk/*

USER taskd
EXPOSE 53589

VOLUME /app/taskd_data

ENV TASKDATA=/app/taskd_data

CMD ["taskd"]
