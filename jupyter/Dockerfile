ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk update && apk upgrade \
    && apk add --no-cache tini python3 libstdc++ openblas freetype wget ca-certificates \
    && pip3 install --upgrade pip setuptools \
    && apk add --no-cache --virtual .build-deps python3-dev make cmake clang clang-dev g++ linux-headers openblas-dev freetype-dev libffi-dev openssl-dev \
    && pip3 install --upgrade pymysql sqlalchemy requests homeassistant influxdb \
    && echo "c.NotebookApp.tornado_settings = { 'headers': { 'Content-Security-Policy': ''}}" >> /root/.jupyter/jupyter_notebook_config.py \
    && echo "c.MappingKernelManager.cull_idle_timeout = 600" \
    && apk del .build-deps \
    && rm -r /root/.cache

EXPOSE 8889
WORKDIR /data
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root"]
