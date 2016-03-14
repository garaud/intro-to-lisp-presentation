
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   (gentle) Introduction to Lisp  ;;;
;;;     Damien Garaud / @jazzydag    ;;;
;;;      2016-03-30 -- Bordeaux      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;
;;  Some Examples  ;;
;;;;;;;;;;;;;;;;;;;;;

;; Build a list
(list 1 2 3 4)
(list 1 "two" 3.14 -5 t)
(list 1 "two" 3.14 -5 (list -6 2.19 nil))


;; Operations: +, *, /, -
(+ 3 4)
;; => Prefix Notation
(+ 3 4 6 7 8) ; reduce for free
(/ (* 3 6) (+ 1 3))

;; Note about reduce
;; reduce f acc (a b c d) => f(d f(c f(b f(a acc))))


;; Function call
(length (list 4 5 6))
(evenp 2)
(evenp 9)
(zerop 1)

;; S-expressions
;; * atom
;;   - int/float
;;   - string
;;   - boolean
;;   - symbol (variable / function name)
;; * list
;;   - ()
;;   - (S-expr S-expr S-expr)

;; Atoms
21
3.14
"John Coltrane"
nil
t
'symbol


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Functions Definition  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; avg
(defun avg (x y)
  "compute avg between 2 numbers"
  (/ (+ x y) 2))

(avg 10 5)

;; high-order with a map
(mapcar 'evenp (list 1 2 3 4 5))
(reduce 'avg (list 1 2 3 4 5))

(quote (a b c d))
'(a b c d)
