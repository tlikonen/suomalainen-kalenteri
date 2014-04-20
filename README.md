Suomalaiset merkkipäivät Emacsin kalenteriin
============================================

(Finnish national and Christian holidays for Emacs's calendar)


Tietoja
-------

`suomalainen-kalenteri.el` on ohjelma tai asetustiedosto, jonka avulla
[Emacs][]-tekstieditorin kalenteriin saadaan suomalaiset merkkipäivät.
Kalenteriin tulevat kaikki viralliset merkkipäivät sekä joitakin muita
vakiintuneita merkkipäiviä kuten aprillipäivä, Lucian päivä ja eräitä
Ahvenanmaan merkkipäiviä.

[Emacs]: http://www.gnu.org/software/emacs/


Asentaminen
-----------

Helpoin asennustapa on [Marmalade][]- tai [Melpa][]-pakettivaraston
käyttäminen. Sitä kautta asennus on automaattinen eikä mitään erityistä
tarvitse tehdä.

[Marmalade]: http://marmalade-repo.org/
[Melpa]:     http://melpa.milkbox.net/

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

Tämä ohjelma on yleistä omaisuutta, eli se on vapaa tekijänoikeuksista.
Ohjelmaa levitetään siinä toivossa, että siitä on hyötyä muille.
Ohjelman tekijä ei anna mitään takuuta ohjelman toiminnasta, ei edes
lupausta, että se sopii johonkin tiettyyn käyttötarkoitukseen.
