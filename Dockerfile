ARG BASE_IMAGE_VERSION
ARG BASE_IMAGE

FROM registry.opensource.zalan.do/zmon/$BASE_IMAGE:$BASE_IMAGE_VERSION

# OPENTRACING
RUN pip3 install -U lightstep==3.0.11
ENV ZMON_AGENT_OPENTRACING_TRACER lightstep
ENV OPENTRACING_LIGHTSTEP_COMPONENT_NAME zmon-agent-core
ENV OPENTRACING_LIGHTSTEP_ACCESS_TOKEN fc2222e1918a18d4cab912f3842aac34
ENV OPENTRACING_LIGHTSTEP_COLLECTOR_HOST tracing.stups.zalan.do
ENV OPENTRACING_LIGHTSTEP_COLLECTOR_PORT 8443

