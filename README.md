# Valvontajärjestelmä

Valvontajärjestelmä, jolla voidaan seurata tilan lämpötilaa ja tilassa tapahtuvia liikkeitä. Järjestelmän käyttöliittymänä toimii verkkosivu,
jossa voidaan asettaa ajastettuja hälytyksiä ja tarkkailla antureiden arvoja sekä tilasta otettuja valokuvia.

Järjestelmä toimii Nucleo mikrokontrollerin ja Raspberry Pi:n avulla. Nucleo huolehtii antureista, ja Raspberry hoitaa valokuvaamisen ja tietokantayhteyden.
Järjestelmässä on lämpötila-anturi, ovimagneetti ja liikeanturi, joiden tilojen muutoksia tallennetaan tietokantaan. 
Jos liikeanturi tai ovimagneetti aktivoituvat hälytysten ollessa käytössä käyttäjälle ilmoitetaan hälytyksestä sähköpostitse.
