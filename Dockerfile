FROM python:3.9-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive

# Dev pre-reqs
RUN \
    apt-get update && apt-get upgrade -y \
        && apt-get install gcc -y \
        && apt-get install g++ -y \
        && apt-get install libc6-dev -y \
		&& apt-get install make -y \
		&& apt-get install pkg-config -y \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/python/question_generator

WORKDIR /home/python/question_generator

COPY . .

RUN pip install -r requirements.txt

CMD ["/bin/bash"]
