FROM alpine:3.7
RUN apk add --no-cache \
    python3 \
    nodejs \
    bash \
    bash-completion \
    git \
    git-bash-completion \
    groff \
    less \
    nano \
    vim
RUN pip3 install awscli
RUN npm install -g serverless serverless-python-requirements

# Git setup
RUN mkdir /root/.bash
WORKDIR /root/.bash
RUN git clone https://github.com/jimeh/git-aware-prompt.git
WORKDIR /

# clone workshop
WORKDIR /root
RUN \
    git clone https://github.com/ServerlessOpsIO/aws-serverless-workshops.git; \
    cd aws-serverless-workshops; \
    git submodule init
WORKDIR /

# AWS setup
RUN mkdir /root/.aws
WORKDIR /root/.aws
ADD files/root_.aws_config config
ADD files/root_.aws_credentials credentials
RUN aws configure set default.region us-east-1
RUN aws configure set default.output json
WORKDIR /

WORKDIR /root
ADD files/root_.profile .profile
ADD files/root_.bashrc .bashrc
WORKDIR /

# startup
WORKDIR /root
ADD files/startup.sh /startup.sh
RUN echo 'root:serverlessopstraining' | chpasswd
RUN chmod +x /startup.sh
ENTRYPOINT [ "/startup.sh" ]
