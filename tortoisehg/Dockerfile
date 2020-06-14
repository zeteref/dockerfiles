# You should run your application with the QT_DEBUG_PLUGINS environment variable set to 1 to see what might go wrong when the plugin is loaded.

FROM python:3 AS build
RUN apt update && apt install -y \
    build-essential \
    pyqt5.qsci-dev \
    mercurial \
    libgl1

RUN pip install \
    pyqt5 \
    mercurial \
    qscintilla

WORKDIR /opt/
RUN hg clone https://bitbucket.org/tortoisehg/thg/

WORKDIR /opt/thg
RUN python setup.py install

FROM izilef/kdiff3qt
RUN apt update && apt install -y \
        mercurial \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-randr0 \
        libxcb-render-util0 \
        libxcb-shape0 \
        libxcb-xfixes0 \
        libxcb-xinerama0 \
        libxcb-xkb1 \
        libxkbcommon-x11-0 \
        libfontconfig \    
        libgssapi-krb5-2 \          
        libglib2.0-0 \
        libdbus-1-3 \
        libgl1 \
        python3 \
        python3-setuptools \
        --no-install-recommends && \
    apt clean
COPY --from=build /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=build /opt/thg/thg /usr/local/bin/thg
ENV PYTHONPATH=/usr/local/lib/python3.8/site-packages

CMD [ "python3", "/usr/local/bin/thg" ]
