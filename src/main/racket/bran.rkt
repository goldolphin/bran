#lang racket
(require ffi/unsafe
         ffi/unsafe/define)
(require (prefix-in wp. "wiringPi.rkt"))

;; Pin modes
(struct pin-mode (value))

(define INPUT            (pin-mode 0))
(define OUTPUT           (pin-mode 1))
(define PWM_OUTPUT       (pin-mode 2))
(define GPIO_CLOCK       (pin-mode 3))
(define SOFT_PWM_OUTPUT  (pin-mode 4))
(define SOFT_TONE_OUTPUT (pin-mode 5))
(define PWM_TONE_OUTPUT  (pin-mode 6))

;; Basic functions
(define (gpioSetup)
  (wp.wiringPiSetup))

(define (pinMode pin mode)
  (wp.pinMode pin (pin-mode-value mode)))

(define (digitalWrite pin value)
  (wp.digitalWrite pin value))

(define (digitalRead pin)
  (wp.digitalRead pin))

; pin:   1
; value: 0 - 1024
(define (pwmWrite pin value)
  (wp.pwmWrite pin value))

; channel: 0, 1
; speed: 500000 - 32000000
(define (spiSetup channel speed)
  (wp.wiringPiSPISetup channel speed))

(define (spi channel type data)
  (let ([buf (malloc 'atomic type)])
    (ptr-set! buf type data)
    (wp.wiringPiSPIDataRW channel buf (ctype-sizeof type))
    (ptr-ref buf type)))

(define (spiByte channel data)
  (spi channel _byte data))

(define (spiInt channel data)
  (spi channel _int data))

;; AD5206 Digital Pot
(struct ad5206 (channel cs))

(define (ad5206Setup pot)
  (match pot
    [(ad5206 channel cs) (pinMode cs OUTPUT)]))

(define (ad5206Create channel cs)
  (let ([pot (ad5206 channel cs)])
    (ad5206Setup pot)
    pot))

; pot: ad5206?
; address: 0 - 5
; value: 0 - 255
(define (ad5206Write pot address value)
  (match pot
    [(ad5206 channel cs)
     (digitalWrite cs 0)
     (spiByte channel address)
     (spiByte channel value)
     (digitalWrite cs 1)]))

(provide (all-defined-out))
