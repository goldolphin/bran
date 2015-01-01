#lang racket/base
(require "bran.rkt")

;; gpio
(setup)
(pinMode 1 OUTPUT)
(digitalWrite 1 1)

;; spi
(spiSetup 0 500000)

;; AD5206
(define pot (ad5206 0 1 12))
(ad5206Setup pot)
(ad5206Write pot 0 64)
