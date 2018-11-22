FROM alpine:edge

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        build-base \
        libx11-dev \
        libxpm-dev \
        libxt-dev \
        ncurses-dev \
        sudo \
        make \
        git \
        curl \
        python \
        python-dev \
        python3-dev \
        py3-pip \
        lua-dev \
        fzf && \
        rm -rf /var/cache/apk/*

RUN echo 'root:root' |chpasswd
RUN adduser -S editor \
    && echo "editor ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo 'editor:editor' | chpasswd

USER editor
WORKDIR /home/editor

WORKDIR /home/editor/vim
RUN sudo git clone https://github.com/vim/vim && \
    cd vim && \
    sudo ./configure --with-features=huge \
    --enable-luainterp \
    --enable-pythoninterp=dynamic \
    --enable-python3interp \
    --enable-multibyte && \
    sudo make && \
    sudo make install

WORKDIR /home/editor


RUN curl -fLo /home/editor/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY vimrc /home/editor/.vimrc
RUN vim +PlugInstall +qa
RUN sudo rm -rf vim && \
    mkdir src

WORKDIR /home/editor/src
ENTRYPOINT ["vim"]
