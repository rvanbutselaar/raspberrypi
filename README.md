# raspberrypi

## Installatie

- Installeer Raspberry Pi OS Lite op een SD kaart.
- Plaats een leeg bestand met als naam "ssh" in de root van het SD kaartje, om zo ssh te activeren.
- Kopieer het init.sh bestand uit deze repo naar het SD kaartje.
- Start de Pi op en maak verbinding via ssh en voer het bestand uit om de initiele installatie uit te voeren.

```bash
ssh pi@[ip]
/init.sh
```

## amazon-ecr-credential-helper

Volg de stappen in de onderstaande link voor de root user:

<https://github.com/awslabs/amazon-ecr-credential-helper#configuration>

## Prometheus

```bash
cd /data
sudo docker-compose up -d
```

## Slimme meter P1 uitlezen

```bash
sudo docker run -p 8000:8000 --device=/dev/ttyUSB0 --rm -ti --name esmr5_exporter esmr5_exporter:1.0
```

Zie:
https://github.com/sbkg0002/prometheus_esmr5

## TODO

- verify and use my own esmr5 version from the apps dir
- backup grafana dashboards
