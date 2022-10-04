# [Choice] .NET Core version: 3.1, 2.1
ARG VARIANT=3.1
FROM mcr.microsoft.com/vscode/devcontainers/dotnet:0-${VARIANT}

COPY library-scripts/azcli-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/azcli-debian.sh \
    && curl -Lo /usr/local/bin/bicep https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64 \
    && chmod +x /usr/local/bin/bicep \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


## Install hugo
COPY Hugo/hugo_0.104.0_linux-amd64.deb /tmp/hugo_0.104.0_linux-amd64.deb

RUN dpkg -i /tmp/hugo_0.104.0_linux-amd64.deb

RUN apt-get install -f

## Install Go
COPY go/go1.18.linux-amd64.tar.gz /tmp/go1.18.linux-amd64.tar.gz

RUN tar -C /usr/local -xvf /tmp/go1.18.linux-amd64.tar.gz

# this doesn't seem to work...need to add to ~/.profile
COPY go/.profile /home/vscode/.profile