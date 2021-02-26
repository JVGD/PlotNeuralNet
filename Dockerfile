FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install -y --no-install-recommends  \
        texlive-latex-base \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-latex-extra

WORKDIR /workdir

COPY . /workdir

RUN chmod +x /workdir/tikzmake.sh

ENTRYPOINT [ "/bin/bash", "/workdir/tikzmake.sh" ]