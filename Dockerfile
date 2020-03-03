FROM registry.opensource.zalan.do/stups/python:latest

RUN apt-get update && apt-get install -y \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    git

COPY . /agent

WORKDIR /agent

RUN pip3 install -U setuptools -e git+https://github.com/zalando-zmon/opentracing-utils.git#egg=opentracing_utils

RUN python setup.py install

# OPENTRACING
RUN pip3 install -U lightstep==3.0.11
ENV ZMON_AGENT_OPENTRACING_TRACER lightstep
ENV OPENTRACING_LIGHTSTEP_COMPONENT_NAME zmon-agent-core
ENV OPENTRACING_LIGHTSTEP_ACCESS_TOKEN fc2222e1918a18d4cab912f3842aac34
ENV OPENTRACING_LIGHTSTEP_COLLECTOR_HOST tracing.stups.zalan.do
ENV OPENTRACING_LIGHTSTEP_COLLECTOR_PORT 8443

CMD ["zmon-agent"]
