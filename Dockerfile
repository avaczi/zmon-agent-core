ARG BASE_IMAGE_VERSION
ARG BASE_IMAGE

FROM registry.opensource.zalan.do/zmon/$BASE_IMAGE:$BASE_IMAGE_VERSION

# OPENTRACING
RUN pip3 install -U lightstep
