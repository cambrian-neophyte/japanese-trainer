#lang racket/base
(require (only-in racket/list range))
(require (only-in racket/format ~a))
(require (only-in racket/list shuffle))
(require "hiragana.rkt")
(require "foundations.rkt")
(require "verbs.rkt")
(define (print-character c)
  (cond ((< #x309F c) (void))
        (else (display (integer->char c))
              (print-character (+ c 1)))))


(define (repeat value times)
  (map (lambda (x) value) (range times)))

(define (make-random-word word-length)
  (define alphabet (hash->list known-hiragana))
  (define word (map (lambda (i) (list-ref alphabet i)) (map (lambda (x) (random (length alphabet))) (range word-length))))
  (define solution (foldr string-append  "" (map symbol->string (map car word))))
  (define question (foldr string-append  "" (map cdr word)))
  (cons question solution))


(define (test word)
  (display (~a "What does " (car word) " mean?\n"))
  (define input (read-line (current-input-port) 'any))
  (if (equal? input (cdr word))
      (display "That is correct. ")
      (display (~a "That is wrong. It means " (cdr word) ".\n"))))

(define (run-test iterations)
  (cond ((< 0 iterations)
         (test (make-random-word 3))
         (run-test (+ iterations -1)))
        (else (display "done."))))
(define (run-verbs)
  (for ((v (shuffle verbs))) (test v))
  (display "Test finished."))
(define (j word) (romaji->hiragana word))



(run-verbs)