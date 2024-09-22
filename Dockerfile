
FROM --platform=$BUILDPLATFORM alpine AS certs
RUN apk update && apk add ca-certificates

FROM busybox
COPY --from=certs /etc/ssl/certs /etc/ssl/certs

ARG TARGETOS
ARG TARGETARCH

COPY binaries/${TARGETOS}/${TARGETARCH}/shaman /bin/

LABEL Description="shaman server" Name="shaman" Version="1.0"

CMD [ "/bin/shaman", "-c", "/conf/conf.json" ]
