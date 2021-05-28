FROM ubuntu AS python3.8
RUN apt update && apt install python3.8 python3-pip python3.8-venv -y

FROM python3.8 AS app-base
WORKDIR /app
COPY /app/ .
RUN python3.8 -m venv venv
RUN . venv/bin/activate
RUN python3.8 -m pip install -r requirements.txt

FROM app-base AS run-stage
ENTRYPOINT [ "uvicorn hello:app --reload --host 0.0.0.0" ]