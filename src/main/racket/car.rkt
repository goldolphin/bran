#lang racket/base
(require "bran.rkt")

(setup)
(pinMode 1 OUTPUT)
(digitalWrite 1 1)

;; spi
(spiSetup 0 500000)


;; (wiringPiSetupSys)
;; (spiByte 1 2)
;; (spiInt 1 2)
