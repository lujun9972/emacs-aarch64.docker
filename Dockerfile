FROM aarch64/ubuntu
RUN apt-get update && \
    apt-get install -y \
            git \
            autoconf \
            automake \
            build-essential \
            imagemagick \
            libdbus-1-dev \
            libgif-dev \
            libgnutls-dev \
            libgtk2.0-dev \
            libjpeg-dev \
            libmagick++-dev \
            libncurses-dev \
            libpng-dev \
            libtiff-dev \
            libx11-dev \
            libxpm-dev \
            texinfo \
            && \
    rm -rf /var/lib/apt/lists/*
RUN git clone --branch master --depth 1 git://git.sv.gnu.org/emacs.git && \
    cd emacs && \
    ./autogen.sh && \
    ./configure --with-mailutils && \
    make && \
    make install && \
    cd .. && \
    rm -rf emacs
ENTRYPOINT ["emacs"]
