FROM alpine:3.18

LABEL org.opencontainers.image.source=https://github.com/DarthMikke/wsgi

RUN apk add openssh git bash python3 py3-pip gcc python3-dev musl-dev

RUN mkdir /venv
RUN python3 -m venv /venv
ENV PATH /venv/bin:$PATH
RUN pip3 install uvicorn

COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN mkdir /app
WORKDIR /app

ENTRYPOINT [ "/run.sh" ]
CMD [ "production" ]

EXPOSE 8000
