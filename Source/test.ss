#!/usr/bin/env racket
#lang racket

(require rackunit)
(require (prefix-in konsult: "search.ss"))


;; test simple word
(check-equal?
 (konsult:search-word "mesmo, até mesmo")
 "eĉ:\tmesmo, até mesmo")

;; test start-metacharacter
(check-equal?
 (konsult:search-word "^eĥo")
 "eĥo:\teco")

;; test end-metacharacter
(check-equal?
 (konsult:search-word "tabaco$")
 "tabako:\tbot. tabaco")

;; test dot-metacharacter
(check-equal?
 (konsult:search-word "ave.truz")
 "struto:\tzoo. avestruz")

;; test star-metacharacter
(check-equal?
 (konsult:search-word "^a.*lão.*ação$")
 "aŭkcio:\tleilão, arrematação")

;; test multiple subresults
(check-equal?
 (konsult:search-word "^vento:")
 (string-append "vento:\tvento, sopro\n"
                "\tventego:\ttufão, furacão\n"
                "\tventumi:\ttr. abanar, ventilar\n"
                "\tventumilo:\tleque, abano"))

;; test multiple results
(check-equal?
 (konsult:search-word "^vento")
 (string-append "vento:\tvento, sopro\n"
                "\tventego:\ttufão, furacão\n"
                "\tventumi:\ttr. abanar, ventilar\n"
                "\tventumilo:\tleque, abano\n"
                "ventoli:\ttr. ventilar, arejar\n"
                "\tventolilo:\tventilador"))

;; test gauge callback
(let* ((count #f)
       (gauge (λ (cur max)
               (check-pred integer? cur)
               (check-pred integer? max)
               (check-true (<= cur max))
                (set! count #t))))
  (check-pred string? (konsult:search-word "^a" #:gauge gauge))
  (check-true count))

(displayln "all tests performed")

