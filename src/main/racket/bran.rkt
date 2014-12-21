#lang racket/base
(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer define-wiringpi (ffi-lib "libwiringPi"))

(define-wiringpi pinMode (_fun _int _int -> _void))
(define-wiringpi digitalWrite (_fun _int _int -> _void))
(define-wiringpi pwmWrite (_fun _int _int -> _void))
(define-wiringpi digitalRead (_fun _int -> _int))
(define-wiringpi wiringPiSPISetup (_fun _int _int -> _int))
(define-wiringpi wiringPiSPIDataRW (_fun _int _pointer _int -> _int))

(define (spi channel type data)
  (let ([buf (malloc 'atomic type)])
    (ptr-set! buf type data)
    (wiringPiSPIDataRW channel buf (ctype-sizeof type))
    (ptr-ref buf type)))

(define (spiByte channel data)
  (spi channel _byte data))

(define (spiInt channel data)
  (spi channel _int data))

;; (pinMode 2 3)
;; (spiByte 1 2)
;; (spiInt 1 2)
