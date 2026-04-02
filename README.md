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

Ta repozitorij vsebuje zbirko Jupyter Notebookov za uporabo platforme Planet Insights.

Dostop do podatkov:

* [Iskanje podatkov izbranega območja](planet_iskanje_aoi.ipynb)
* [Iskanje in prenos podatkov PlanetScope](planet_iskanje_prenos.ipynb)
* [Iskanje podatkov PlanetScope in ustvarjanje naročila](planet_iskanje_narocilo.ipynb)
* [Opazovanje vodostaja s PlanetScope podatki](planet_opazovanje_voda.ipynb)
* [Planet Subscription (korak za korakom)](planet_narocnine_navodila.ipynb)
* [Ustvarjanje PlanetScope naročnine v eno kolekcijo](planet_narocnine_priprava.ipynb)
* [Spremljanje vseh Planet naročnin](planet_narocnine_spremljanje.ipynb)

Aplikacije:

* [Analiza kmetijskih površin z uporabo časovnih vrst indeksov](planet_indeksi_kmetijstvo.ipynb)
* [Klasifikacija kmetijskih površin z uporabo časovnih vrst indeksov](planet_klasifikacija_kmetijstvo.ipynb)
* [Opazovanje vodostaja s PlanetScope podatki](planet_opazovanje_voda.ipynb)
* [Opazovanje požara s PlanetScope podatki](planet_opazovanje_pozara.ipynb)

## Priprava okolja Python

Namestite Python

* [Anaconda Python 3](https://www.anaconda.com/products/distribution). Lahko za Windows, macOS ali Linux.
* [GitHub - conda-forge/miniforge: A conda-forge distribution.](https://github.com/conda-forge/miniforge). 

Miniforge je lahka distribucija orodja Conda, ki se uporablja za upravljanje Python paketov in virtualnih okolij. Privzeto uporablja repozitorij conda-forge, kjer so odprtokodni in pogosto posodobljeni paketi. Pogosto se uporablja kot manjša in bolj odprtokodna alternativa Anacondi ali Minicondi. Če niste prepričani, katero različico izbrati, je Miniforge dobra izbira, saj je hitra, enostavna za uporabo in ima široko podporo paketov.

Če uporabljate Miniforge, lahko ukaz `conda` vedno zamenjate z `mamba`. Mamba je veliko hitrejša za upravljanje okolij in nameščanje paketov. Mamba je še posebej priporočljiva, če imate veliko paketov ali pogosto posodabljate okolja. Njen privzet kanal je `conda-forge`, ki je zelo zanesljiv in pogosto posodobljen, zato ni potrebe po dodatnem nastavljanju kanalov.

Vedno uporabljajte ukazno vrstico (Windows) ali terminal (macOS/Linux), ki vsebuje condo ali mambo, to je `Anaconda Powershell Prompt` ali `Miniforge Prompt`. Preverite namestitev in delovanje Conda/Mamba z naslednjimi ukazi:

```powershell
conda --version
conda env list
```

Premaknite se v mapo, kjer je datoteka `environment.yml`, recimo `~/Python/planet-si`.

```powershell
cd ~/Python/planet-si
```

Preverite trenutne nastavitve okolij in kanalov.

```powershell
conda config --show envs_dirs
conda config --show channels◘
```

Če uporabljate Anaconda, dodajte kanal `conda-forge` in nastavite prioriteto kanalov na `strict`, da zagotovite, da se paketi namestijo iz `conda-forge`, kjer so pogosto bolj posodobljeni in združljivi z drugimi paketi. Če uporabljate Miniforge, je ta korak že opravljen, saj je `conda-forge` privzeti kanal.

```powershell
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Ustvarite novo okolje z imenom `planeteo` in namestite Python 3.12. To je priporočljivo, saj omogoča boljšo organizacijo in ločevanje projektov. Vsako okolje lahko vsebuje različne različice paketov, kar je koristno za preprečevanje konfliktov med projekti.

```powershell
conda env create -f environment.yml
```

Aktivirajte okolje `planeteo`, da boste lahko uporabljali nameščene pakete in knjižnice. Aktivacija okolja je ključna, saj omogoča, da se ukazi in programi izvajajo znotraj tega okolja, kar zagotavlja, da uporabljate prave različice paketov. Preverite delovanje okolja z zagonom Jupyter Lab:

```powershell
conda activate planeteo
jupyter lab
```

Če naletite na težave, posodobite knjižnice v okolju `planeteo` z naslednjim ukazom, vendar boste s tem dobili okolje, ki ni več enako kot v `environment.yml`. Če želite ohraniti okolje usklajeno z `environment.yml`, uporabite ukaz za posodobitev okolja:

```powershell
conda activate planeteo
conda update --all
```

Če okolje že obstaja in želite samo namestiti manjkajoče knjižnice, uporabite:

```powershell
conda env update --file environment.yml --prune
```

## Avtentikacija

Za uporabo teh Notebookov, ki komunicirajo s [Planet API-ji](https://docs.planet.com/develop/apis), potrebujete uporabniški račun za prijavo. Dokumentacija za avtentikacijo je na voljo na [Authentication | Planet Documentation](https://docs.planet.com/develop/authentication/).

Nekateri Notebooki uporabljajo neposredno avtentikacijo z vašim Planet računom. Pozvani boste k prijavi prek spletne povezave in potrditvi avtorizacije. Več informacij najdete v zgoraj navedeni dokumentaciji za avtentikacijo.

### Dostop do Planet API ključa v Pythonu

Drugi Notebooki uporabljajo avtentikacijo s Planet API ključem. API ključ najdete na strani z nastavitvami računa [Account ・ Planet Insights Platform](https://insights.planet.com/account/#/settings).

API ključ lahko na sistemu izvozite kot okoljsko spremenljivko. Prva varinata naredi to za trenutno sejo terminala, druga pa trajno nastavi spremenljivko v vašem sistemu.

```powershell
# trenutna seja terminala
$env:PL_API_KEY = "vaš_api_ključ"
# trajno nastavi spremenljivko v sistemu
[System.Environment]::SetEnvironmentVariable("PL_API_KEY","vaš_api_ključ","User")
```

Preverite ali je API ključ pravilno nastavljen.

```powershell
echo $env:PL_API_KEY
```

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

## Prispevek

Prispevki k temu repozitoriju so dobrodošli.

## Avtorji

* [Krištof Oštir](https://github.com/krostir)
* [Ana Potočnik Buhvald](https://github.com/anapot)
* [Planet Labs](https://github.com/planetlabs)

## Zahvala

Zahvaljujemo se Planet Labs, Inc. za razvoj in vzdrževanje platforme Planet Insights ter za deljenje teh Notebookov z javnostjo. Hvala tudi skupnosti Geo Slovenija za podporo.

Razvoj je financirala Javna agencija za znanstvenoraziskovalno in inovacijsko dejavnost Republike Slovenije v okviru programa št. P2-0406 Opazovanje Zemlje in geoinformatika ter projekta GC-0006 Geoprostorske informacijske tehnologije za odporno in trajnostno družbo.

## Avtorske pravice

Copyright (c) 2026 UL FGG