FROM ghcr.io/helmfile/helmfile:latest
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
