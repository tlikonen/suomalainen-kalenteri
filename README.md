Suomalaiset merkkipäivät Emacsin kalenteriin
============================================

(Finnish national and Christian holidays for Emacs's calendar)


Tietoja
-------

`suomalainen-kalenteri.el` on ohjelma tai asetustiedosto, jonka avulla
[Emacs][]-tekstieditorin kalenteriin saadaan suomalaiset merkkipäivät.
Kalenteriin tulevat viralliset suomalaiset merkkipäivät, jotka on
julkaistu [Helsingin yliopiston almanakkatoimiston][Almanakka]
kalenterissa.

[Emacs]:     http://www.gnu.org/software/emacs/
[Almanakka]: http://almanakka.helsinki.fi/


Asentaminen
-----------

Helpoin asennustapa on [Melpa][]-pakettivaraston käyttäminen. Sitä
kautta asennus on automaattinen eikä mitään erityistä tarvitse tehdä.

[Melpa]: http://melpa.milkbox.net/

Asentamiseen on myös toinen tapa: suomalainen kalenteri tulee käyttöön,
kun tiedoston `suomalainen-kalenteri.el` sisältämä Emacs Lisp -koodi
suoritetaan. Lienee järkevintä asettaa Emacs tekemään se
automaattisesti, kun `calendar`-osa ladataan. Emacsin
käynnistystiedostoon `~/.emacs` tai `~/.emacs.d/init.el` voi lisätä
esimerkiksi seuraavanlaisen lausekkeen:

    (eval-after-load 'calendar
      '(load "~/hakemistopolku/suomalainen-kalenteri.el" t t))


Lähdekoodi
----------

Ohjelman lähdekoodi ja tämä esittelyteksti on ladattavissa osoitteesta
<<https://github.com/tlikonen/suomalainen-kalenteri>>.


Tekijä ja tekijänoikeus
-----------------------

Tekijä: Teemu Likonen <<tlikonen@iki.fi>>

PGP: [4E10 55DC 84E9 DFF6 13D7 8557 719D 69D3 2453 9450][PGP]

Tämä ohjelma on yleistä omaisuutta, eli se on vapaa tekijänoikeuksista.
Ohjelmaa levitetään siinä toivossa, että siitä on hyötyä muille.
Ohjelman tekijä ei anna mitään takuuta ohjelman toiminnasta, ei edes
lupausta, että se sopii johonkin tiettyyn käyttötarkoitukseen.

[PGP]: http://koti.kapsi.fi/~dtw/pgp-key.asc
