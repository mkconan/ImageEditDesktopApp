FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less
RUN apt-get install -y libsm6 libxext6 libxrender-dev libgl1-mesa-dev
RUN apt-get install -y x11-xserver-utils
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

COPY requirements.txt ./
COPY edit_app_v3.py ./
COPY Parrots.png ./

RUN pip install --no-cache-dir -r requirements.txt

#RUN xhost +

CMD [ "python", "edit_app_v3.py" ]