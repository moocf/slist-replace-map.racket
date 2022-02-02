#lang racket

;; slist.replace-map: Symbol x Symbol x SList -> SList
;; usage: (slist.replace-map new old slist) = substitute symbol in a symbol list
(define slist.replace-map
  (lambda (new old slist)
    (map (lambda (sexp)
           (slist.replace-map-sexp new old sexp))
         slist)))

(define slist.replace-map-sexp
  (lambda (new old sexp)
    (if (not (list? sexp))
        (if (eqv? old sexp)
            new
            sexp)
        (slist.replace-map new old sexp))))

; s-list ::= ({s-exp}*)
; s-exp  ::= symbol | s-list

; s-list ::= ()
;        ::= (s-exp . s-list)
; s-exp  ::= symbol | s-list

; (.) = cons operator
