FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y \
    lib32z1 libseccomp-dev socat supervisor \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN groupadd -r ctf && useradd -m -r -g ctf ctf

ADD config/supervisord.conf /etc/
COPY --chown=ctf challenge/ /home/ctf/

RUN chown -R root:ctf /home/ctf
RUN chmod 750 /home/ctf/cfi
# RUN chmod 440 /home/ctf/flag.txt

EXPOSE 1337

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
