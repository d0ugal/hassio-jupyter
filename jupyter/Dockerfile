ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk update && apk upgrade
RUN apk add --no-cache tini python3 libstdc++ openblas freetype wget ca-certificates
RUN python3 -m ensurepip && rm -r /usr/lib/python*/ensurepip
RUN pip3 install --upgrade pip setuptools
RUN apk add python3-dev make cmake clang clang-dev g++ linux-headers openblas-dev freetype-dev libffi-dev openssl-dev

RUN pip3 install --verbose --upgrade numpy matplotlib jupyter ipywidgets pandas pymysql sqlalchemy requests homeassistant

# Some libraries I'd like to add by default... but the build time is too slow.
# seaborn, fbprophet, calmap

RUN jupyter nbextension enable --py widgetsnbextension
RUN echo "c.NotebookApp.token = ''" > /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8889
WORKDIR /data
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root"]
