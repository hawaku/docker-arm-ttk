FROM mcr.microsoft.com/powershell:lts-ubuntu-18.04 as build

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Azure/arm-ttk.git

FROM mcr.microsoft.com/powershell:lts-ubuntu-18.04

COPY --from=build /arm-ttk/arm-ttk /arm-ttk

WORKDIR /arm-ttk

CMD ["./Test-AzTemplate.sh", "-?"]
