FROM ubuntu:18.04

WORKDIR /root/
ENV PATH="/root/bin:${PATH}"

ARG git_config_user_name=""
ARG git_config_user_email=""

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y make gcc g++ diffstat texinfo chrpath gcc-multilib git gawk build-essential autoconf libtool libncurses-dev gettext gperf lib32z1 libc6-i386 g++-multilib python-git bash-completion python3 locales cpio wget curl vim bc rsync ccache unzip python3-distutils qemu qemu-kvm && \
    rm -rf /var/cache/apt && \
    rm -rf /var/lib/apt/lists && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && \
    chmod +x /usr/bin/repo && \
    useradd -ms /bin/bash user

USER user
WORKDIR /home/user
ENV LC_ALL en_US.UTF-8
ADD .bashrc /home/user
RUN git config --global user.email "${git_config_user_emmail}" && \
    git config --global user.name "${git_config_user_name}"
ENTRYPOINT ["bash", "-c"]

