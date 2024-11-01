FROM debian:bullseye

RUN apt update && apt install -y python3 > /dev/null 2>&1
RUN apt-get clean && rm -rf /var/lib/apt/lists/* > /dev/null 2>&1

COPY ./game /game

WORKDIR /game

EXPOSE 5000

CMD ["python3", "-m", "http.server", "5000"]