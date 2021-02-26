FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends  \
        texlive-latex-base \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-latex-extra

WORKDIR /workdir

ENTRYPOINT [ "/bin/bash" ]