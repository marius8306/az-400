FROM ubuntu:20.04

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \
    sudo \
    wget

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

ARG TARGETARCH=amd64
ARG AGENT_VERSION=2.213.2

WORKDIR /azp
RUN if [ "$TARGETARCH" = "amd64" ]; then \
      AZP_AGENTPACKAGE_URL=https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz; \
    else \
      AZP_AGENTPACKAGE_URL=https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-${TARGETARCH}-${AGENT_VERSION}.tar.gz; \
    fi; \
    curl -LsS "$AZP_AGENTPACKAGE_URL" | tar -xz

COPY ./start.sh .
COPY installers /installers

RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash
RUN sudo apt-get install nodejs
RUN node -v 
RUN npm install -g gulp typescript
RUN npm install -g @pnp/cli-microsoft365

# RUN /installers/nodetools.sh
RUN /installers/netcore.sh

RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]