# Uusi sivusto

Tarvittavia juttuja

- Docker (https://docs.docker.com/desktop/)
- make (ainakin Macin ja Linuxin kehitystyökalujen peruskauraa)
- kehitysympäristöksi esim VSCode (https://code.visualstudio.com/)

## Asentaminen

Kloonaa repo

Hyppää komentorivillä repon juureen

Anna komento `make`. Make hakee aina tuoreimmat sorsat, lataa ja käynnistää
tarvittavat docker-containerit ja lataa Drupalin edellyttämät kirjastot koneelle.

Ensimmäisellä kerralla aja seuraavaksi komento `make install`. Tämä suorittaa
skriptin, joka alustaa Drupal-sivuston.

**Huom!** Mikäli edellisen komennon seurauksena saat virheilmoituksen "The 'block' entity type does
not exist" tai jotain vastaavaa, aja komento `docker-compose exec web drush cache:rebuild`. Jotain
töhkää oli jäänyt välimuistiin ja se pitää puhdistaa. (Tutkittavaa tulevaisuuteen.)

Tämän jälkeen sivustoa pääset testailemaan osoitteessa http://localhost:8080/. Käyttäjätunnus ja
salasana ovat molemmat 'admin'.

## Sammuttaminen ja käynnistäminen

Ensimmäisen asennuskerran jälkeen Dockerin voi käynnistää uudelleen komennolla `make start` ja
sammuttaa komennolla `make stop`.

## Sivuston päivittäminen

Jos Drupal-core tai yksittäisiä moduleita pitää päivittää, tämä onnistuu komennolla
`make update`.

## Debuggaaminen VSCodella

Muokkaa repon juuressa olevaa .vscode/launch.json -tiedostoa siten, että siinä
on ainakin seuraava konfiguraatio (tai voi tämä olla koko tiedoston sisältökin):

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for XDebug",
      "type": "php",
      "request": "launch",
      "log": true,
      "stopOnEntry": false,
      "pathMappings": {
        "/var/www/web": "/<työhakemisto>/drupal/web"
      }
    },
  ]
}
```
