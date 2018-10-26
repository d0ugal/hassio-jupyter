ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk update && apk upgrade \
    && apk add --no-cache tini python3 libstdc++ openblas freetype wget ca-certificates \
    && pip3 install --upgrade pip setuptools \
    && apk add --no-cache --virtual .build-deps python3-dev make cmake clang clang-dev g++ linux-headers openblas-dev freetype-dev libffi-dev openssl-dev \
    && pip3 install --upgrade pymysql sqlalchemy requests homeassistant influxdb \
    && echo "c.NotebookApp.tornado_settings = { 'headers': { 'Content-Security-Policy': ''}}" >> /root/.jupyter/jupyter_notebook_config.py \
    && echo "c.MappingKernelManager.cull_idle_timeout = 600"  >> /root/.jupyter/jupyter_notebook_config.py \
    && apk del .build-deps \
    && rm -r /root/.cache

EXPOSE 8889
WORKDIR /data
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root"]

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="Jupyter" \
    io.hass.description="Create and share documents that contain live code, equations, visualizations and narrative text" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Dougal Matthews <dougal@dougalmatthews.com>" \
    org.label-schema.description="Create and share documents that contain live code, equations, visualizations and narrative text" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Jupyter" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/d0ugal/hassio-jupyter/" \
    org.label-schema.usage="https://github.com/d0ugal/hassio-jupyter/" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/d0ugal/hassio-jupyter/" \
    org.label-schema.vendor="Dougal Matthews"
