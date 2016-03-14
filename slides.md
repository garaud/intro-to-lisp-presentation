## (Gentle) Introduction to Lisp

<center>
<u>Functional Programming Meetup</u>
</br>
<div style="font-size: 0.9em">Bordeaux &ndash; Node</div>
2016-03-30
</br>
<div style="font-size: 0.8em">Damien Garaud /
<a href="https://twitter.com/jazzydag">@jazzydag</a>
</div>

</center>

---

## Who Am I?

* Damien Garaud

* Scientist Programmer

* Trainer & learning-addict

* [@jazzydag](https://twitter.com/jazzydag)

* https://github.com/garaud

---

## A Little Story

Dimitri Fontaine aka [@tapoueh](https://twitter.com/tapoueh)

a PostgreSQL expert and Lisper-friendly

[pgloader](http://pgloader.io/) loads data into PostgreSQL **fast**

<!-- .element class="fragment" data-fragment-index="1" -->

> "I switched from Python to Common Lisp because
> I wanted to use a modern language" - @tapoueh

<!-- .element class="fragment" data-fragment-index="2" -->

[7th European Lisp Symposium](http://www.european-lisp-symposium.org/editions/2014/)
<!-- .element class="fragment" data-fragment-index="2" -->

More than <u>20x faster</u> than the previous Python version <a href="http://tapoueh.org/blog/2014/05/14-pgloader-got-faster">[1]</a>

<!-- .element class="fragment" data-fragment-index="3" -->

<!-- Note: extension add more db engine -->
<!-- Note: performance and threading capabilities -->
<!-- Note: sudoku solver 10x faster than python -->

---

# Lisp?

<img src="/images/Lisp-glossy-120.jpg" width="15%">

<div style="font-size:5em;align: center;">
( )
</div>

---

# Tiny Demo

It's gonna be legen... wait for it

<img src="/images/barney.gif" width="60%">

`M-x irony-mode`

---

## History

* 1958 John McCarthy MIT
<!-- .element class="fragment" -->
* LISP: LISt Processing
<!-- .element class="fragment" -->
* Not "Lots of Irritating and Silly Parentheses"
<!-- .element class="fragment" -->
* 1970: Lisp Machines
<!-- .element class="fragment" -->
* Artificial Intelligence
<!-- .element class="fragment" -->
* 1980: need for standardization (Common Lisp)
<!-- .element class="fragment" -->
* 1994: ANSI Common Lisp
<!-- .element class="fragment" -->

---

## Which Lisp?

* Common Lisp
<!-- .element class="fragment" -->

* Scheme (1970)
<!-- .element class="fragment" -->

* Emacs Lisp (1976)
<!-- .element class="fragment" -->

* Racket (1996)
<!-- .element class="fragment" -->

* Arc (2001 Paul Graham)
<!-- .element class="fragment" -->

* Clojure (2007 JVM)
<!-- .element class="fragment" -->

* LFE as Lisp Flavored Erlang (2008 BEAM)
<!-- .element class="fragment" -->

* Hylang (2013 Lisp & Python)
<!-- .element class="fragment" -->

---

## Languages Features

* Dynamic Typing
<!-- .element class="fragment" -->
* Functional & Imperative
<!-- .element class="fragment" -->
* High-order Functions
<!-- .element class="fragment" -->
* Object-oriented
<!-- .element class="fragment" -->
* Prefix (polish) Notation
<!-- .element class="fragment" -->
* Macros
<!-- .element class="fragment" -->
* Garbage Collector
<!-- .element class="fragment" -->
* Source as a data structure
<!-- .element class="fragment" -->

... of course, it's just a list
<!-- .element class="fragment" -->

---

## S-expression

* List `()` or an atom

* Each element is separated by a whitespace
<!-- .element class="fragment" -->

* An element can be:
<!-- .element class="fragment" -->
    - a list
<!-- .element class="fragment" -->
    - an atom
<!-- .element class="fragment" -->

---

## Atoms

* Basic Type

    - string
    - integer
    - float
    - nil

* A symbol
<!-- .element class="fragment" -->

    - variable name
<!-- .element class="fragment" -->
    - function name
<!-- .element class="fragment" -->

---

## Examples

```lisp
(1 "two" -5 "jazz" 4.2)

(hello-world "John")

(fibo 12)

(/ (+ a b) (* c d))

(foo (bar "baz") "quz")
```

---

## Function Definition

`defun` keyword

```lisp
(defun hello (name)
  "print hello"
  (format t "Hello ~a!~%" name))


(hello "lambda meetup")
```
<!-- .element class="fragment" -->


This is a S-expression
<!-- .element class="fragment" -->

with two nested S-exprs, 4 symbols, two strings and one boolean
<!-- .element class="fragment" -->

---

## Evaluation: how does it work

* Just read the S-expression
<!-- .element class="fragment" -->
* Valid S-expression
<!-- .element class="fragment" -->
* Valid Lisp expression
<!-- .element class="fragment" -->
* Suppose the first element is a function or an operator
<!-- .element class="fragment" -->
* Left to the right
<!-- .element class="fragment" -->
* Evaluate all but first, then apply the first
<!-- .element class="fragment" -->

---

## Examples

```lisp
(+ (* 2 15) (* 6 2))
```
<!-- .element class="fragment" -->

` 42`
<!-- .element class="fragment" -->


```lisp
(hello "you")
```
<!-- .element class="fragment" -->

` "Hello you!"`
<!-- .element class="fragment" -->


```lisp
(let ((name "lambda meetup"))
  (hello name))
```
<!-- .element class="fragment" -->

` "Hello lambda meetup!"`
<!-- .element class="fragment" -->

```lisp
(mapcar 'evenp (list 0 1 2 3 4))
```
<!-- .element class="fragment" -->

` (T nil T nil T)`
<!-- .element class="fragment" -->

---

## REPL

* Read
<!-- .element class="fragment" -->

* Eval
<!-- .element class="fragment" -->

* Print
<!-- .element class="fragment" -->

* Loop
<!-- .element class="fragment" -->

---

## Returned Value

The last S-expression
<!-- .element class="fragment" -->

```lisp
(if (zerop 0)
  (+ 5 3)
  (* 2 2))
```
<!-- .element class="fragment" -->

Which value?
<!-- .element class="fragment" -->

` 8`
<!-- .element class="fragment" -->

---

## "If" and the standard evaluation rule

```lisp
(if (zerop 0)
  (+ 1 3)
  (* 3 2))
```

* Can you see the problem?

* Special operators
<!-- .element class="fragment" -->

* Not really evaluated as usual
<!-- .element class="fragment" -->


---

## Not Always Evaluation

You saw the `if`. What's else?

```lisp
(+ 2 5)

(let ((a 2)
      (b 21))
  (* a b))
```
<!-- .element class="fragment" -->

* Variables evaluation: it's OK
<!-- .element class="fragment" -->
* What about the high-order functions
<!-- .element class="fragment" -->
* You want to pass a name of a function
<!-- .element class="fragment" -->
* Not evaluate me please
<!-- .element class="fragment" -->

---

## Higher-order functions

```lisp
(defun algo (pred struct)
  "docstring"
  (impl))
```

```lisp
(algo pred (list "coltrane" "davis" "hancock"))
```
<!-- .element class="fragment" -->

* pred shouldn't be evaluated as is
<!-- .element class="fragment" -->
* variable name error
<!-- .element class="fragment" -->
* Special "quote"
<!-- .element class="fragment" -->

---

## Special Quote

There is a function for that:

```lisp
(quote (a b c d))
```

```lisp
(defun my-pred (lhs rhs)
  "my predicate func"
  (> lhs rhs))
```
<!-- .element class="fragment" -->

```lisp
(algo (quote my-pred) struct)
```
<!-- .element class="fragment" -->

special ' syntax
<!-- .element class="fragment" -->

```lisp
(algo 'my-pred struct)
```
<!-- .element class="fragment" -->


---

## Take a Breath

What did we see:

* Evaluation rules
<!-- .element class="fragment" -->

* S-expressions, S-expressions everywhere!
<!-- .element class="fragment" -->

* Source code as a data structure
<!-- .element class="fragment" -->

* `(defun foo (arg) (body))` is a S-expression
<!-- .element class="fragment" -->

* Thus `arg` can be a simple list or...
<!-- .element class="fragment" -->

... a function definition
<!-- .element class="fragment" -->

Don't worry... the end is coming
<!-- .element class="fragment" -->


---

## Macros

It's about code generation

</br>

... but not really like C macros
<!-- .element class="fragment" -->

</br>

<u style="font-size: 1.3em">The programmable programming language</u>
<!-- .element class="fragment" -->

---

## Macros by example

Make a list as Python does:

```python
seq = []
for elt in range(10):
    if elt % 2 == 0:
        seq.append(elt)
```


```python
# use comprehension list
seq = [x for x in range(10) if x % 2 == 0]
```
<!-- .element class="fragment" -->

Comprehension Lists
<!-- .element class="fragment" -->

And you want to implement this feature in Common Lisp
<!-- .element class="fragment" -->

---

## Macros by example

```lisp
(lcomp x for x in (range 10) if (= (mod x 2) 0))
```

</br>

You can define your own language extension
<!-- .element class="fragment" -->

</br>

```lisp
(defmacro lcomp (expression for var in list cond cond-test)
  "doc here"
  (body))
```
<!-- .element class="fragment" -->

Lisp code generation writing Lisp code
<!-- .element class="fragment" -->

---

## Further

* CLOS: Common Lisp Object System

* Quicklisp: a package manager

* Compilation: SBCL or Clozure CL

* [Make a Lisp](https://github.com/kanaka/mal)

---

## References

* [SICP](https://mitpress.mit.edu/sicp/)
* [The Little Schemer](https://mitpress.mit.edu/books/little-schemer)
* [Practical Common Lisp](http://www.gigamonkeys.com/book/)
* [Common Lisp Recipes](http://weitz.de/cl-recipes/)

---

### Thanks

<img src="/images/lisp.jpg" width="100%">

https://xkcd.com/224/
