#lang racket
(require "foundations.rkt")
(require "hiragana.rkt")
(define verbs (definitions->entries (list "kaku" "write"
                                          "taberu" "eat"
                                          "hanasu" "speak"
                                          "nemuru" "sleep"
                                          "yomu" "read"
                                          "hataraku" "work"
                                          "aruku" "walk"
                                          "kiku" "listen to"
                                          "motsu" "possess"
                                          "konomu" "prefer"
                                          "shiru" "know"
                                          "nomu" "drink"
                                          "kiru" "cut"
                                          "hashiru" "run"
                                          "suru" "do"
                                          )))


(define irregular-godan '("はいる" "はしる" "いる" "かえる" "かぎる" "きる" "しあべる" "しる"))

(define (irregular-godan? verb)
  (member verb irregular-godan))

(define ichidan-suffix-list (map (lambda (x) (j (string-append x "ru")))  (filter (lambda (x) (or (string-suffix? x "i") (string-suffix? x "e"))) (map symbol->string (hash-keys hiragana)))))
(define (ichidan-verb? verb)
  (and (not (irregular-godan? verb))
       (not (irregular-verb? verb))
       (findf (lambda (suffix) (string-suffix? verb suffix)) ichidan-suffix-list)))
(define (irregular-verb? verb)
  (or (string-suffix? verb "くる")
      (string-suffix? verb "する")))

  
(define (godan-verb? verb)
  (or (irregular-godan? verb)
      (and (not (ichidan-verb? verb))
           (not (irregular-verb? verb)))))

(provide verbs)
