#lang racket/base
(require "bran.rkt")

(wiringPiSetup)
(pinMode 1 1)
(digitalWrite 1 1)

;; (wiringPiSetupSys)
;; (spiByte 1 2)
;; (spiInt 1 2)
