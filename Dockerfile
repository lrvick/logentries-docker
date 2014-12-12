FROM debian:wheezy

RUN apt-get update -y --fix-missing
RUN apt-get upgrade -y --fix-missing
RUN apt-get install -y --force-yes rsyslog

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD ./50-default.conf /etc/rsyslog.d/50-default.conf

EXPOSE 514
EXPOSE 514/udp

# Default command to run on boot
CMD ["/tmp/run.sh"]
