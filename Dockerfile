FROM ubuntu:bionic

ENV PROJECT_NAME website
ENV PROJECT_ROOT /home/${PROJECT_NAME}
ENV JEKYLL_PORT 4000

EXPOSE ${JEKYLL_PORT}

RUN apt update
RUN apt install -y build-essential ruby ruby-dev vim git python3.8
RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN ln -s /usr/bin/python3.8 /usr/bin/python3
RUN gem install bundler jekyll

RUN mkdir -p ${PROJECT_ROOT}
ADD . ${PROJECT_ROOT}
WORKDIR ${PROJECT_ROOT}
RUN bundle install
