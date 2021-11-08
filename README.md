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

[Emacs]:     https://www.gnu.org/software/emacs/
[Almanakka]: https://almanakka.helsinki.fi


Asentaminen
-----------

Helpoin asennustapa on [Melpa][]-pakettivaraston käyttäminen. Sitä
kautta asennus on automaattinen eikä mitään erityistä tarvitse tehdä.

[Melpa]: https://melpa.org/

Asentamiseen on myös toinen tapa: suomalainen kalenteri tulee käyttöön,
kun tiedoston `suomalainen-kalenteri.el` sisältämä Emacs Lisp -koodi
suoritetaan. Lienee järkevintä asettaa Emacs tekemään se
automaattisesti, kun `calendar`-osa ladataan. Emacsin
käynnistystiedostoon `~/.emacs` tai `~/.emacs.d/init.el` voi lisätä
esimerkiksi seuraavanlaisen lausekkeen:

    (with-eval-after-load 'calendar
      (load "~/hakemisto/suomalainen-kalenteri.el" t t))


Lähdekoodi
----------

Ohjelman lähdekoodi ja tämä esittelyteksti on ladattavissa osoitteesta
<<https://github.com/tlikonen/suomalainen-kalenteri>>.


Tekijä ja tekijänoikeus
-----------------------

Tekijä: Teemu Likonen <<tlikonen@iki.fi>>

OpenPGP-avain: [6965F03973F0D4CA22B9410F0F2CAE0E07608462][PGP]

Kalenterin sisällöllä eli merkkipäivien kalenteripaikoilla ei ole
tekijänoikeutta. Kalenterin Emacs-toteutus ei sekään välttämättä ylitä
teoskynnystä, mutta vaikka se ylittäisi, tekijä luopuu kaikista
tekijänoikeuksistaan pysyvästi ja enimmäislaajuudessaan.
Luopumisjulistus on [Creative Commons CC0][CC0] -lisenssin mukainen.

[PGP]: http://www.iki.fi/tlikonen/pgp-key.asc
[CC0]: https://creativecommons.org/publicdomain/zero/1.0/legalcode.fi
