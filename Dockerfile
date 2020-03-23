FROM alpine:3.10

ENV TERRAFORM_VERSION=0.12.23

RUN apk update && apk add wget unzip bash curl ca-certificates python python-dev py-pip build-base \
    && pip install awscli --upgrade \
    && apk --purge -v del py-pip \
    rm -f /tmp/* && \
    rm -f /var/cache/apk/* && \
    rm -f /var/tmp/*

RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN mkdir -p $HOME/app

ADD infra/ $HOME/app/infra

ADD scripts/ $HOME/app/scripts

WORKDIR $HOME/app