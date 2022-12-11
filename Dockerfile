FROM alpine:latest
ENV DOTNET_ROOT=/opt/dotnet PATH=${PATH}:/opt/dotnet:/opt/dotnet/tools
RUN apk update && apk add icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib curl bash
RUN mkdir -p -m 777 ${DOTNET_ROOT} && \
    curl -Lo /tmp/dotnet-install.sh https://dot.net/v1/dotnet-install.sh && \
    chmod a+x /tmp/dotnet-install.sh && \
    cd /opt/dotnet && \
    /tmp/dotnet-install.sh -c Current -v latest -i ${DOTNET_ROOT} --runtime dotnet && \
    rm -f /tmp/dotnet* && \
    wget https://download.visualstudio.microsoft.com/download/pr/5d9c71c5-929f-4307-9150-0be20991efed/61fd3999701e7aaa236499c9c7521b2d/aspnetcore-runtime-7.0.0-linux-musl-x64.tar.gz && \
    tar zxf aspnetcore-runtime-7.0.0-linux-musl-x64.tar.gz  -C "$DOTNET_ROOT"
COPY MinApi/MinApi/bin/Debug/net7.0/ /bin
