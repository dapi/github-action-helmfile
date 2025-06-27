FROM alpine:3.14 AS src

ARG HELM_VERSION=v3.18.2
ARG HELM_ARCHIVE=helm-${HELM_VERSION}-linux-amd64.tar.gz

ARG HELMFILE_VERSION=1.1.2
ARG HELMFILE_ARCHIVE=helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz

ADD https://get.helm.sh/${HELM_ARCHIVE} ${HELM_ARCHIVE}
RUN tar -zxf ${HELM_ARCHIVE} --strip=1

ADD https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/${HELMFILE_ARCHIVE} ${HELMFILE_ARCHIVE}
RUN tar -zxf ${HELMFILE_ARCHIVE}

FROM scratch

COPY --from=src ./helmfile /helmfile
COPY --from=src ./helm /helm

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/helmfile"]
