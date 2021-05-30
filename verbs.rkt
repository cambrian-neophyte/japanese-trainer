#lang racket/base
(require "foundations.rkt")
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
                                          )))
(provide verbs)
