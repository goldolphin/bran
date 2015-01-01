#lang racket/base
(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer define-wiringpi (ffi-lib "libwiringPi"))

;; Pi Functions
(define-wiringpi wiringPiSetup (_fun -> _int))

(define-wiringpi wiringPiSetupSys (_fun -> _int))

(define-wiringpi pinMode (_fun _int _int -> _void))

(define-wiringpi digitalWrite (_fun _int _int -> _void))

(define-wiringpi pwmWrite (_fun _int _int -> _void))

(define-wiringpi digitalRead (_fun _int -> _int))

(define-wiringpi wiringPiSPISetup (_fun _int _int -> _int))

(define-wiringpi wiringPiSPIDataRW (_fun _int _pointer _int -> _int))

(provide (all-defined-out))
