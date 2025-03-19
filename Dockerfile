FROM python:3.9-slim
LABEL description="biplabkumarbehera"
WORKDIR /app
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
# it remove the all the cached metadata  
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /app
RUN pip install mysqlclient
RUN pip install --no-cache-dir  -r requirements.txt
COPY . /app
EXPOSE 5000
CMD ["python", "app.py"]
