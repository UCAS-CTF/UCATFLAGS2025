(defpackage #:cclgen
  (:use :cl :ryo.macros))

(in-package :cclgen)

(defconstant +max-depth+ 10)
(defparameter *depth* 0)
(defparameter *char* #\a)

(defmacro random-branches (&rest branches)
  "Choose a random branch in `branches' to execute (at Runtime).
If reaches the `+max-depth+', return the first branch as result. "
  `(if (>= *depth* +max-depth+)
       ,(first branches)
       (let ((*depth* (1+ *depth*)))
         (case (random ,(length branches))
           ,@(loop for branch in branches
                   for i      from 0
                   collect `(,i ,branch))))))

(defmacro randfmt (control left right)
  `(random-branches
    (fmt ,control ,left  ,right)
    (fmt ,control ,right ,left)))

(defmacro def-random-machine (name lambda-list progn &body func-branches)
  "Make a random code Machine (like BNF with args). "
  `(defun ,name ,lambda-list
     ,(fmt "Random Walk Machine ~A" name)
     (labels ,(loop for (func-desc . branches) in func-branches
                    for func = (if (listp func-desc)
                                   (first func-desc)
                                   func-desc)
                    for args = (if (listp func-desc)
                                   (rest  func-desc)
                                   ())
                    for single-p = (length<= branches 1)
                    collect `(,func ,args (,(if single-p 'progn 'random-branches)
                                           ,@branches)))
       ,progn)))

(def-random-machine c-randflag (flag)
    (cprogram
     '("stdio.h")
     (nconc (list (fmt "int chr = ~A"   (cintexpr (random 26)))
                  (fmt "int count = ~A" (cintexpr 0))
                  (cprintf "I am drunk, so I may say a lot helpless words")
                  (cprintf "But I am sweet, so I leave something good in source")
                  (cprintf "I mean... ")
                  (cprintf "the struct of code... ")
                  (cprintf "damn, I forgot, what's that? ")
                  (cprintf "the flag is what? "))
            (map 'list #'ctestchar flag)
            (list (cprintf "")
                  (cprintf "now i am awake, so let's see if your flag is correct...")
                  (cif (ceql "count" (cintexpr (length flag)))
                       (cprintf "YES!")
                       (cprintf "NO!")))))
  ((cprogram headers main-codes)
   (fmt "~{#include <~A>~%~}int main () ~A"
        headers (apply #'cblock main-codes)))

  ((ctestchar char)                     ; dangerous for side-effect
   (progn
     (setf *char* char)
     (cblock-no-wrap
      "chr = getchar()"
      (cif (ceql "chr" (cintexpr (char-code char)))
           (cincf "count")
           (crandexpr)))))

  ((cincf var)
   (fmt "~A++" var)
   (fmt "~A += ~A" var (cintexpr 1))
   (fmt "~A = ~A" var (randfmt "(~A + ~A)" var (cintexpr 1))))

  ((cdecf var)
   (fmt "~A--" var)
   (fmt "~A -= ~A" var (cintexpr 1))
   (fmt "~A = ~A" var (fmt "(~A - ~A)" var (cintexpr -1))))

  ((ceql a b)
   (randfmt "~A == ~A" a b))

  ((cblock-no-wrap &rest codes)
   (fmt "~{~A;~^ ~}" codes))

  ((cblock &rest codes)
   (fmt "{~{~A;~^ ~}}" codes))

  (randstr
   "this is the flag???"
   "this is not the flag!!!"
   "the flag is..."
   "can you see this?"
   "random!!!!!!"
   "bro, you are sweet... "
   "count++;"
   (map 'string (lambda (char)
                  (random-branches
                   (char-upcase   char)
                   (char-downcase char)))
        (randstr)))

  ((cprintf str)
   (fmt "printf(\"~A\\n\")" str))

  (crandcond
   (randfmt "~A == ~A" "chr"   (cintexpr (random 26)))
   (randfmt "~A <= ~A" "count" (cintexpr (random 26)))
   (randfmt "~A != ~A" "count" (cintexpr (random 26)))
   (crandcond-true)
   (crandcond-false))

  (crandcond-true
   (randfmt "~A == ~A" "chr" (cintexpr (char-code *char*)))
   (let ((a (random 26)))
     (ceql (cintexpr a) (cintexpr a)))
   (let ((a (random 26)))
     (fmt "~A < ~A" (cintexpr a) (cintexpr (+ a 1 (random 26))))))

  (crandcond-false
   (randfmt "~A != ~A" "chr" (cintexpr (char-code *char*)))
   (randfmt "~A == ~A" "chr" (cintexpr (+ (char-code *char*)
                                          (* (- 1 (* 2 (random 2)))
                                             (1+ (random 26))))))
   (let ((a (random 26)))
     (ceql (cintexpr a) (cintexpr (+ a 1 (random 26)))))
   (let ((a (random 26)))
     (fmt "~A < ~A" (cintexpr a) (cintexpr (- a 1 (random 26))))))

  (crandexpr-never-exec                 ; never exec
   "chr = getchar()"
   "count++"
   "chr++"
   "chr--"
   "count--"
   (crandexpr))

  (crandexpr-exec-safe                  ; safe even exec
   (cblock-no-wrap (cincf "chr") (cdecf "chr"))
   (cblock-no-wrap (cdecf "chr") (cincf "chr"))
   (cblock-no-wrap (cdecf "count") (cincf "count"))
   (cblock-no-wrap (cincf "count") (cdecf "count")))

  (crandexpr                            ; may exec
   (cprintf (random-string))
   (crandexpr-exec-safe)
   (cif (crandcond-false) (crandexpr-never-exec) (crandexpr))
   (cif (crandcond-true)  (crandexpr)  (crandexpr-never-exec))
   (cif (crandcond) (crandexpr) (crandexpr)))

  ((cif cond true &optional (false (crandexpr)))
   (fmt "if (~A) ~A else ~A"    cond (cblock true)  (cblock false))
   (fmt "if (!(~A)) ~A else ~A" cond (cblock false) (cblock true))
   (cif cond true (cif (crandcond-false) (crandexpr) false))
   (cif cond true (cif (crandcond-true) false (crandexpr)))
   (cif (crandcond-true)  (cif cond true (crandexpr)) false)
   (cif (crandcond-true)  (cif cond true false) (crandexpr))
   ;; (cif (crandcond-false) (crandexpr) (cif cond true false))
   ;; (cif (crandcond-false) false (cif cond true (crandexpr)))
   )

  ((cdefvar var type expr)
   (cblock (fmt "~A ~A = ~A" (str:snake-case type) (str:snake-case var) expr)))

  ((cint-times a b)
   (randfmt "(~A * ~A)" (cintexpr a) (cintexpr b)))

  ((cint-asmod int mod)
   (let* ((times (floor int mod))
          (plus  (- int (* times mod))))
     (randfmt "(~A + ~A)"
              (randfmt "(~A * ~A)" (cintexpr times) (cintexpr mod))
              (cintexpr plus))))

  ((cint-asoffset int offset)
   (fmt "(~A - ~A)" (randfmt "(~A + ~A)" int (cintexpr offset)) (cintexpr offset))
   (randfmt "(~A + ~A)" (fmt "(~A - ~A)" int (cintexpr offset)) (cintexpr offset)))

  ((cintexpr int)
   (fmt "~D"   int)
   (cint-asoffset int (random 10))
   (if (> int 0) (fmt "0x~X" int) (fmt "-0x~X" (abs int)))
   (if (> int 0) (cint-asmod int (1+ (random 10))) (cintexpr int))
   (cond ((<= (char-code #\A) int (char-code #\Z))
          (random-branches
           (randfmt "(~A + ~A)" "'A'" (cintexpr (- int (char-code #\A))))
           (fmt     "(~A - ~A)" "'Z'" (cintexpr (- (char-code #\Z) int)))))
         ((<= (char-code #\a) int (char-code #\z))
          (random-branches
           (randfmt "(~A + ~A)" "'a'" (cintexpr (- int (char-code #\a))))
           (fmt     "(~A - ~A)" "'z'" (cintexpr (- (char-code #\z) int)))))
         (t (cintexpr int))))
  )

(let ((flag     "rAnd0m1fFf")
      (not-flag "asdfasfdas"))
  (flet ((gen ()
           (with-open-file (out "./rand.c" :direction :output
                                           :if-does-not-exist :create
                                           :if-exists :supersede)
             (write-string (c-randflag flag) out))
           (uiop:run-program "gcc -o rand rand.c -O0"))
         (test (&optional (input flag))
           (car (last (str:lines
                       (with-output-to-string (out)
                         (with-input-from-string (in input)
                           (uiop:run-program "./rand"
                                             :input in
                                             :output out))))))))
    (gen)
    (assert (string= "YES!" (test flag)))
    (assert (string= "NO!"  (test not-flag)))))
