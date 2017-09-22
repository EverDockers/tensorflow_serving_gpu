# Tensorflow serving (gpu)

* repository
    * [`baikangwang/tensorflow_serving_gpu`](https://hub.docker.com/r/baikangwang/tensorflow_serving_gpu/)
* tags
    * [`3.5`,`latest`](#3.5-latest)
    * [`2.7`](#2.7)
    
## `3.5`,`latest`    
    
### Description

This image can be used as tensorflow serving server and client in __python 3.5__

|Docker||
|:---|:---|
|__Docker Pull__|`docker pull baikangwang/tensorflow_serving_gpu[:3.5]`|
|__Dockerfile__|<https://github.com/EverDockers/tensorflow_serving_gpu/blob/python3/Dockerfile>|

### Usage

> Tensorflow Serving - Server
```bash
nvidia-docker run -it -v <local working dir>:/projects -p 9000:9000 --name <ts_server> baikangwang/tensorflow_serving_gpu:3.5 /bin/bash 
```
> Tensorflow Serving - Client

```bash
# console, desktop program
nvidia-docker run -it -v <local working dir>:/projects --net=host --name <ts_client> baikangwang/tensorflow_serving_gpu:3.5 /bin/bash
 
# web app
nvidia-docker run -it -v <local working dir>:/projects --net=host -p 8080:8080 --name <ts_client> baikangwang/tensorflow_serving_gpu:3.5 /bin/bash
```

> `<local working dir>`: it's a placeholder presenting the client code directory  
> `<ts_server>`: it's a placeholder presenting the container name being played as _SERVER_ role  
> `<ts_client>`: it's a placeholder presenting the container name being played as _CLIENT_ role  
> `9000:9000`: the serving service port, the server part is configurable with the evn variable `$SERVING_PORT`  
> `8080:8080`: the client app port which is optional for console, desktop programs, the server part is configurable with the evn variable `$CLIENT_PORT`  

### Components

* grpc 1.6.0
* Python 3.5
* Tensorflow 1.3.0
* Tensorflow Serving 1.3.0

## Tensorflow serving tasks

see [tensorflow_serving_tutorials](tensorflow_serving_tutorials.md)