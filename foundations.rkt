#lang racket
(require (only-in racket/list filter-map))
(require (only-in racket/string string-prefix?))
(require (only-in racket/list empty?))
(require (only-in racket/list argmax))
(require "hiragana.rkt")


(define (replace-longest-prefix word prefix-list)
  (if (equal? word "") '() 
      (let ((prefixes (filter-map (lambda (kana) (if (string-prefix? word kana) kana #f)) prefix-list)))
        (if (empty? prefixes) (if (>= 1 (string-length word)) (list "#") (cons "#" (replace-longest-prefix (substring word 1 prefix-list))))
            (let ((kana (argmax string-length prefixes)))
              (cons kana (replace-longest-prefix (substring word (string-length kana) ) prefix-list)))))))
(define (romaji->hiragana word)
  (define h-format (compose (lambda (romaji)
                              (if (hash-has-key? hiragana romaji)
                                  (hash-ref hiragana romaji)
                                  (symbol->string romaji)))
                            string->symbol))
  (foldr string-append ""  (map h-format (replace-longest-prefix word (map symbol->string (hash-keys hiragana))))))

;conversion  (romaji <translation>) -> (hiragana <translation>)
(define (make-entry romaji meaning)
  (cons (string->symbol (romaji->hiragana romaji))  meaning))

; groups elements in a list into a list of pairs
; eg. (a b c d e f) is turned to ((a b) (c d) (e f))
(define (list->pairs l)
  (if (eq? '() l) '()
      (cons (cons (car l) (cadr l)) (list->pairs (cddr l)))))
(define (definitions->entries definitions)
  (map (lambda (x) (make-entry (car x) (cdr x))) (list->pairs definitions)))

;short-term romaji->hiragana conversion
(define (j word) (if (list? word) (map j word)
                     (romaji->hiragana word)))


(define (romaji? string)
  (member (lambda (x) (< x 256)) (map char->integer (string->list string))))
(provide definitions->entries romaji->hiragana j)