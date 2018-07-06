FROM alpine:3.7
MAINTAINER vad.viktor@gmail.com

# use pyenv understandable version
ARG PYTHON_VERSION
ENV PYTHON_VERSION=${PYTHON_VERSION:-3.6.6}

COPY scripts/package-setup.sh /
RUN /package-setup.sh && \
    rm -fv /package-setup.sh

COPY scripts/pyenv-setup.sh /
RUN bash /pyenv-setup.sh $PYTHON_VERSION && \
    rm -fv /pyenv-setup.sh

COPY scripts/init.sh /init.sh
