FROM jenkins/ssh-slave
LABEL maintainer="Xuanwo <xuanwo@yunify.com>"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN curl --show-error --fail --location -o - \
    "https://releases.hashicorp.com/nomad/0.9.3/nomad_0.9.3_linux_amd64.zip" \
    | zcat > /usr/bin/nomad &&\
    chmod 0755 /usr/bin/nomad
RUN curl --show-error --fail --location -o - \
    "https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64" > /usr/bin/json2hcl &&\
    chmod 755 /usr/bin/json2hcl

ENTRYPOINT ["setup-sshd"]
