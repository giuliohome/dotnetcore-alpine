FROM alpine:3.12
ENV DOTNET_ROOT=/opt/dotnet PATH=${PATH}:/opt/dotnet
RUN apk update && apk add icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib curl bash
RUN mkdir -p -m 777 ${DOTNET_ROOT} && \
    curl -Lo /tmp/dotnet-install.sh https://dot.net/v1/dotnet-install.sh && \
    chmod a+x /tmp/dotnet-install.sh && \
    cd /opt/dotnet && \
    /tmp/dotnet-install.sh -c Current -v latest -i ${DOTNET_ROOT} --runtime dotnet && \
    rm -f /tmp/dotnet-install.sh
