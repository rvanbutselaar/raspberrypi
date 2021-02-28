# raspberrypi

## Installatie

* Installeer Raspberry Pi OS Lite op een SD kaart. 
* Plaats een leeg bestand met als naam "ssh" in de root van het SD kaartje, om zo ssh te activeren.
* Kopieer het init.sh bestand uit deze repo naar het SD kaartje.
* Start de Pi op en maak verbinding via ssh en voer het bestand uit om de initiele installatie uit te voeren.

```
ssh pi@[ip]
/init.sh
```

## Slimme meter P1 uitlezen

Zie:
https://github.com/sbkg0002/prometheus_esmr5
