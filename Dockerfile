FROM alpine AS download
ARG HELM_VERSION="v3.0.2"
RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - \
    | tar -xzO linux-amd64/helm > /bin/helm && \
    chmod +x /bin/helm

FROM scratch AS final
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.schema-version=1.0 \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/nbarnum/helm-docker"
COPY --from=download /bin/helm /helm
ENTRYPOINT ["/helm"]
