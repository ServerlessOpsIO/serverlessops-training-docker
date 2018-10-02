FROM alpine:3.7
RUN apk add --no-cache \
    python3 \
    nodejs \
    bash \
    bash-completion \
    curl \
    git \
    git-bash-completion \
    groff \
    less \
    nano \
    nano-syntax \
    vim
RUN pip3 install awscli
RUN npm install -g serverless

# Git setup
RUN mkdir /root/.bash
WORKDIR /root/.bash
RUN git clone https://github.com/jimeh/git-aware-prompt.git
WORKDIR /

# AWS setup
RUN mkdir /root/.aws
WORKDIR /root/.aws
ADD files/root_.aws_config config
ADD files/root_.aws_credentials credentials
RUN aws configure set default.region us-east-1
RUN aws configure set default.output json
WORKDIR /

# User setup
WORKDIR /root
ADD files/root_.profile .profile
ADD files/root_.bashrc .bashrc
ADD files/root_.vimrc .vimrc
RUN find /usr/share/nano/ -iname "*.nanorc" -exec echo include {} \; >> .nanorc
WORKDIR /

# startup
ADD files/startup.sh /startup.sh
RUN echo 'root:serverlessopstraining' | chpasswd
RUN chmod +x /startup.sh

RUN mkdir /workshop
VOLUME /workshop
WORKDIR /workshop
ENTRYPOINT [ "/startup.sh" ]

