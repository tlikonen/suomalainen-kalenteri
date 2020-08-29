;;; suomalainen-kalenteri.el --- Finnish holidays for Emacs calendar.

;; Author: Teemu Likonen <tlikonen@iki.fi>
;; URL: https://github.com/tlikonen/suomalainen-kalenteri
;; Keywords: calendar holidays Finnish

;;; Commentary:

;; Finnish national and Christian holidays for Emacs calendar.
;;
;; Holidays follow the calendar published by Helsinki university's
;; almanakkatoimisto <http://almanakka.helsinki.fi/>.
;;
;; License: This program is placed in the public domain. The calendar
;; content (i.e., holidays) is free.

;;; Code:


(eval-when-compile
  (require 'calendar)
  (require 'holidays)
  (require 'solar))


(defconst suomalainen-kalenteri
  '((solar-equinoxes-solstices)

    (holiday-fixed 1 1 "Uudenvuodenpäivä")
    (holiday-fixed 1 6 "Loppiainen")
    (holiday-fixed 1 18 "Rukouspäivä")
    (holiday-fixed 1 19 "Pyhän Henrikin muistopäivä")
    (holiday-fixed 1 27 "Vainojen uhrien muistopäivä")

    (holiday-sexp '(let ((day (calendar-nth-named-day 1 0 2 year 2)))
                     (if (equal day (caar (holiday-easter-etc -49)))
                         (caar (holiday-easter-etc -56))
                       day))
                  "Kynttilänpäivä")
    (holiday-fixed 2 5 "J. L. Runebergin päivä (liputus)")
    (holiday-fixed 2 6 "Saamelaisten kansallispäivä")
    (holiday-fixed 2 14 "Ystävänpäivä")
    (holiday-fixed 2 28 "Kalevalan päivä, suomalaisen kulttuurin päivä (liputus)")
    (holiday-fixed 2 29 "Karkauspäivä")

    (holiday-fixed 3 8 "Kansainvälinen naistenpäivä")
    (holiday-fixed 3 19 "Minna Canthin päivä, tasa-arvon päivä (liputus)")
    (holiday-sexp '(let ((day (calendar-nth-named-day 1 0 3 year 22)))
                     (if (or (equal day (caar (holiday-easter-etc 0)))
                             (equal day (caar (holiday-easter-etc -7))))
                         (caar (holiday-easter-etc -14))
                       day))
                  "Marian ilmestyspäivä")

    (holiday-easter-etc -49 "Laskiaissunnuntai")
    (holiday-easter-etc -47 "Laskiaistiistai")
    (holiday-easter-etc -7 "Palmusunnuntai")
    (holiday-easter-etc -2 "Pitkäperjantai")
    (holiday-easter-etc 0 "Pääsiäispäivä")
    (holiday-easter-etc 1 "2. pääsiäispäivä")
    (holiday-easter-etc 39 "Helatorstai")
    (holiday-easter-etc 49 "Helluntaipäivä")
    (holiday-easter-etc 56 "Pyhän Kolminaisuuden päivä")
    (holiday-easter-etc 91 "Apostolien päivä")
    (holiday-easter-etc 105 "Kirkastussunnuntai")
    (holiday-easter-etc 203 "Uskonpuhdistuksen muistopäivä")

    (when (>= displayed-year 2014)
      (holiday-fixed 4 8 "Romanien kansallispäivä"))
    (holiday-fixed 4 9 "Mikael Agricolan päivä, suomen kielen päivä (liputus)")
    (holiday-fixed 4 27 "Kansallinen veteraanipäivä (liputus)")

    (holiday-fixed 5 1 "Vappu, suomalaisen työn päivä (liputus)")
    (holiday-fixed 5 9 "Eurooppa-päivä (liputus)")
    (holiday-fixed 5 12 "J. V. Snellmanin päivä, suomalaisuuden päivä (liputus)")
    (holiday-float 5 0 2 "Äitienpäivä (liputus)")
    (holiday-float 5 0 3 "Kaatuneitten muistopäivä (liputus, puolitangossa)")

    (holiday-fixed 6 4 "Puolustusvoimain lippujuhlan päivä (liputus)")
    (holiday-float 6 6 1 "Juhannuspäivä, Suomen lipun päivä (liputus)" 20)

    (holiday-fixed 7 6 "Eino Leinon päivä, runon ja suven päivä (liputus)")
    (holiday-fixed 7 27 "Unikeonpäivä")

    (when (>= displayed-year 2020)
      (holiday-float 8 6 -1 "Suomen luonnon päivä"))

    (when (>= displayed-year 2010)
      (holiday-fixed 9 5 "Yrittäjän päivä"))
    (holiday-float 9 0 1 "Mikkelinpäivä" 29)

    (holiday-fixed 10 10 "Aleksis Kiven päivä, suomalaisen kirjallisuuden päivä (liputus)")
    (holiday-fixed 10 24 "YK:n päivä (liputus)")
    (holiday-fixed 10 24 "Rukouspäivä")
    (holiday-float 10 6 1 "Pyhäinpäivä" 31)

    (holiday-fixed 11 6 "Ruotsalaisuuden päivä, Kustaa Aadolfin päivä (liputus)")
    (holiday-float 11 0 2 "Isänpäivä (liputus)")
    (if (>= displayed-year 2020)
        (holiday-fixed 11 20 "Lapsen oikeuksien päivä (liputus)")
      (holiday-fixed 11 20 "Lapsen oikeuksien päivä"))

    (holiday-fixed 12 6 "Itsenäisyyspäivä (liputus)")
    (when (>= displayed-year 2011)
      (holiday-fixed 12 8 "Jean Sibeliuksen päivä, suomalaisen musiikin päivä (liputus)"))

    (holiday-advent -14 "Valvomisen sunnuntai")
    (holiday-advent -7 "Tuomiosunnuntai")
    (holiday-advent 0 "1. adventtisunnuntai")
    (holiday-advent 7 "2. adventtisunnuntai")
    (holiday-advent 14 "3. adventtisunnuntai")
    (holiday-advent 21 "4. adventtisunnuntai")

    (holiday-fixed 12 25 "Joulupäivä")
    (holiday-fixed 12 26 "Tapaninpäivä")
    (holiday-sexp '(let ((day (list 12 27 year)))
                     (if (equal 0 (calendar-day-of-week day)) day))
                  "Apostoli Johanneksen päivä")
    (holiday-fixed 12 28 "Viattomien lasten päivä")

    (holiday-float 3 0 -1 "Kesäaika alkaa (klo 03.00, UTC+2 -> UTC+3)")
    (holiday-float 10 0 -1 "Kesäaika päättyy (klo 04.00, UTC+3 -> UTC+2)"))

  "Finnish national and Christian holidays.
See variable `calendar-holidays' for information about the
format.")


(setq solar-n-hemi-seasons '("Kevätpäiväntasaus" "Kesäpäivänseisaus"
                             "Syyspäiväntasaus" "Talvipäivänseisaus")
      solar-s-hemi-seasons '("Syyspäiväntasaus" "Talvipäivänseisaus"
                             "Kevätpäiväntasaus" "Kesäpäivänseisaus"))


(setq calendar-holidays suomalainen-kalenteri)

(provide 'suomalainen-kalenteri)

;;; suomalainen-kalenteri.el ends here
