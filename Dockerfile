FROM linuxserver/hydra2

RUN apt-get update && apt-get -y install -y python-pip jq

RUN pip install yq

#COPY phpsed.php /
COPY 40-hydraconfig /etc/cont-init.d

HEALTHCHECK --start-period=600s CMD curl -f http://hydra2:5076/nzbhydra || exit 1