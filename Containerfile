FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="s.schmeier@pm.me"

COPY extra-packages /
RUN apk update && \
    apk upgrade && \
    grep -v '^#' /extra-packages | xargs apk add
RUN rm /extra-packages

RUN wget -O /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/v3.7.3/sops-v3.7.3.linux.amd64 && \
    chmod 755 /usr/local/bin/sops

RUN wget -O /tmp/ghq_linux_amd64.zip https://github.com/x-motemen/ghq/releases/download/v1.4.2/ghq_linux_amd64.zip && \
    unzip /tmp/ghq_linux_amd64.zip && \
    mv /tmp/ghq_linux_amd64/ghq /usr/local/bin/ && \
    chmod 755 /usr/local/bin/ghq

RUN wget -O /tmp/notes.zip https://github.com/rhysd/notes-cli/releases/download/v1.6.2/notes_linux_amd64.zip && \
    unzip /tmp/notes.zip && \
    mv /tmp/notes /usr/local/bin/

RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
     
