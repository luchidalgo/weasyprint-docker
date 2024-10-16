FROM python:3.13

RUN apt-get -y update \
    && apt-get install -y \
	build-essential \
	python3-dev \
	python3-pip \
	python3-setuptools \
	python3-wheel \
	python3-cffi \
	libcairo2 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libgdk-pixbuf2.0-0 \
	libffi-dev \
	shared-mime-info \
	libjpeg-dev \
	zlib1g-dev

ADD fonts /usr/share/fonts
ADD requirements.txt /app/requirements.txt
ADD app.py /app/app.py
WORKDIR /app

RUN python3 -m pip install -U setuptools
RUN python3 -m pip install -r requirements.txt

EXPOSE 80

ENV NUM_WORKERS=3
ENV TIMEOUT=120

CMD gunicorn --bind 0.0.0.0:80 --timeout $TIMEOUT --workers $NUM_WORKERS  app:app