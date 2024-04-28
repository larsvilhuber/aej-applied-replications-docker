FROM rocker/verse:4.2.2

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
         locales \
         libcurl4-openssl-dev \
         libssl-dev \
        imagemagick \
        libmagick++-dev \
        gsfonts \
        pandoc \
        libicu-dev \
        libtcl8.6 \
        libtk8.6 \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        texlive-latex-recommended texlive-latex-base texlive-binaries texlive-latex-extra\
        texlive-humanities texlive-bibtex-extra biber \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

COPY global-libraries.R install1.R
COPY programs/libraries.R install2.R
COPY text/libraries.R install3.R
COPY readme-libraries.R install4.R

RUN cat install?.R > install.R && Rscript install.R


