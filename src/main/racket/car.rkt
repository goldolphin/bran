#lang racket
(require "bran.rkt")

;; Car
(struct Car (pot throttleAddr steerAddr))

(define (setup)
  (gpioSetup) 
  (spiSetup 0 500000))

; [-100, 100] -> [0 255]
(define (toPot v)
  (quotient (* 255 (+ v 100)) 200))

; car:   Car?
; speed: [-100, 100]
(define (throttle car speed)
  (match car
    [(Car pot th st)
     (printf "throttle: ~a~n" speed)
     (ad5206Write pot th (toPot speed))]))

; car:   Car?
; angle: [-100, 100]
(define (steer car angle)
  (match car
    [(Car pot th st)
     (printf "steer: ~a~n" angle)
     (ad5206Write pot st (toPot angle))]))

(define (reset car)
  (throttle car 0)
  (steer car 0))
  

;;;
(setup)

;; Create a car
(define car (Car (ad5206Create 0 1) 0 1))

;; Run a 8-pattern path.
(reset car)
(sleep 2)

(throttle car -99)
(steer car 99)
(sleep 5)

(steer car -99)
(sleep 5)

(reset car)

;;;
(provide (all-defined-out))
