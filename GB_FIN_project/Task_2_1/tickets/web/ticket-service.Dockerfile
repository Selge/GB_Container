FROM python:3.9-slim-buster as dev

WORKDIR /app

COPY requirements-dev.txt .
RUN pip install --no-cache-dir -r requirements-dev.txt

COPY . .

CMD [ "python", "app.py" ]


FROM python:3.9-slim-buster as prod

WORKDIR /app

COPY requirements-prod.txt .
RUN pip install --no-cache-dir -r requirements-prod.txt

COPY . .

CMD [ "python", "app.py" ]


FROM python:3.9-slim-buster as lab

WORKDIR /app

COPY requirements-lab.txt .
RUN pip install --no-cache-dir -r requirements-lab.txt

COPY . .

CMD [ "python", "app.py" ]