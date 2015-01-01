#lang racket/base
(require "bran.rkt")

;; gpio
(setup)

;; spi
(spiSetup 0 500000)

;; AD5206
(define pot (ad5206 0 1))
(ad5206Setup pot)
(ad5206Write pot 0 64)
