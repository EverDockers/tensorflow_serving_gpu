FROM baikangwang/tensorflow_gpu:tfonly

MAINTAINER Baker Wang <baikangwang@hotmail.com>

# Serving port
ENV SERVING_PORT 9000
# Client port
ENV CLIENT_PORT 8080

# Serving port & client port
EXPOSE $SERVING_PORT $CLIENT_PORT

RUN apt update && \
    #
    # Prerequisites
    #
    apt install -y --no-install-recommends \
        # Build tools
        build-essential g++ \
        # Developer Essentials
        curl git wget zip unzip \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        #
        # Python 2.7
        # Tensorflow serving still relies on python2, exactly it's that GRPC still dosen't supprt python3
        #
        python2.7 python-dev python-numpy python-pip \
        software-properties-common \
        swig \
        zlib1g-dev \
        libcurl3-dev && \
    # pip
    pip2 install --no-cache-dir --upgrade pip \
     # Fix No module named pkg_resources
     setuptools && \
    # Grpc
    pip2 install --no-cache-dir mock grpcio \
    # TensorFlow Serving Python API PIP package
     tensorflow-serving-api && \
    #
    # Clean up
    #
    apt-get clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    #
    # Install Tensorflow serving 1.3.0
    #
    # Install using apt-get
    echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list && \
    curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add - && \
    apt update && apt install tensorflow-model-server && \
    apt upgrade tensorflow-model-server && \
    #
    # Clean up
    #
    apt-get clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/* && \


WORKDIR /

CMD ["/bin/bash"]