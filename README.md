# Uporaba podatkov Planet

Zbirka Jupyter Notebookov, ki prikazujejo uporabo podatkov Planet. Primeri so povzeti po [GitHub - planetlabs/Notebooks: interactive Notebooks from Planet Engineering](https://github.com/planetlabs/Notebooks). 

Primeri so prilagojeni za uporabo v okviru pogodbe med GURS in podjetjem Planet Labs, Inc. in so namenjeni izobraževanju uporabnikov v okviru skupnosti Geo Slovenija. Pokažejo kako dostopati do podatkov Planet in jih uporabljati za različne namene, zajemajo korake od iskanja in pridobitve podatkov, vizualizacije in analize do priprave poročil.

## Namestitev in uporaba Planet Jupyter Notebookov

### Sistemske zahteve

Za uporabo Planet Jupyter Notebookov potrebujete:

* [Planet račun](https://insights.planet.com/sign-up)
* [Planet API ključ](https://www.planet.com/account/)

### Kloniranje ali posodobitev repozitorija

Če repozitorija še nikoli niste klonirali, zaženite:

```bash
git clone https://github.com/planetlabs/Notebooks.git
cd Notebooks
```

Če ste repozitorij Planet Notebookov že klonirali, ga posodobite in prenesite lokalne spremembe, ki so nastale od zadnje uporabe:

```bash
cd Notebooks
git pull
``` 

## Kazalo Notebookov

Ta repozitorij vsebuje zbirko Jupyter Notebookov, ki vas naučijo uporabljati Planet Insights Platform.



## Avtentikacija

Za uporabo teh Notebookov, ki komunicirajo s [Planet API-ji](https://docs.planet.com/develop/apis), potrebujete uporabniški račun za prijavo. Dokumentacija za avtentikacijo je na voljo na [Authentication | Planet Documentation](https://docs.planet.com/develop/authentication/).

Nekateri Notebooki uporabljajo neposredno avtentikacijo z vašim Planet računom. Pozvani boste k prijavi prek spletne povezave in potrditvi avtorizacije. Več informacij najdete v zgoraj navedeni dokumentaciji za avtentikacijo.

### Dostop do Planet API ključa v Pythonu

Drugi Notebooki uporabljajo avtentikacijo s Planet API ključem. API ključ najdete na strani z nastavitvami računa [Account ・ Planet Insights Platform](https://insights.planet.com/account/#/settings).

API ključ lahko na sistemu izvozite kot okoljsko spremenljivko:

```bash
export PL_API_KEY="YOUR-API-KEY"
```

Če želite, da je API ključ trajno nastavljen (shranjen kot ```PL_API_KEY```), dodajte ukaz ```export``` v datoteko ```~/.bashrc``` ali ```~/.zshrc```. 

V Pythonu API ključ nastavimo v spremenljivko ```PLANET_API_KEY``` iz okoljske spremenljivke, da ga lahko uporabljamo pri API zahtevkih:

```python
# Uvoz modula os za dostop do okoljskih spremenljivk
import os

# Nastavitev API ključa iz okoljske spremenljivke `PL_API_KEY`
PLANET_API_KEY = os.getenv('PL_API_KEY')
```

Planet API ključ je zdaj shranjen v spremenljivki ```PLANET_API_KEY``` in je pripravljen za uporabo v vaši Python kodi.

### Sentinel Hub Python SDK

Nekateri Notebooki v tem repozitoriju uporabljajo [Documentation of sentinelhub Python package — Sentinel Hub 3.11.4 documentation](https://sentinelhub-py.readthedocs.io/en/latest/). Trenutno ta SDK uporablja drugačen način avtentikacije kot Planet API-ji in Planet SDK za Python.

Za Sentinel Hub Python SDK morate vnesti ```client_id``` in ```client_secret```, ki ju dobite v [Account ・ Planet Insights Platform](https://insights.planet.com/account/#/). Podrobna navodila za nastavitev teh poverilnic najdete v [Configuration — Sentinel Hub documentation](https://sentinelhub-py.readthedocs.io/en/latest/configure.html).

```python
from sentinelhub import SHConfig 
import getpass

config = SHConfig()

if not config.sh_client_id or not config.sh_client_secret:
    print("Poverilnic ni bilo mogoče najti, vnesite OAuth ID odjemalca in skrivnost.")
    config.sh_client_id = getpass.getpass("sh_client_id: ")
    config.sh_client_secret = getpass.getpass("sh_client_secret: ")
    config.save()
    print(f"Poverilnice so shranjene v {SHConfig.get_config_location()}")
else:
    print(f"Uporaba poverilnic, shranjenih tukaj: {SHConfig.get_config_location()}")
```


## Avtorske pravice

Copyright (c) 2026 UL FGG