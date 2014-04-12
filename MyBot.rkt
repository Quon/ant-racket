#lang racket

(require "ants.rkt")

(define out (open-output-file "game_logs/out.log" #:exists 'replace))

(define (log str)
  (write str out))

(define DIRECTIONS '(N E S W))

(define (do-setup map-data) (void));;(log (format "~a\n" map-data)))

;;(define (move-ant a directions targets)
;;  (void))
(define (do-turn map-data)
  ;;(print-map)
  (define (move-ant a)
    (define (try-direction dir)
      (and (passable? (destination a dir))
	   (issue-order a dir)))
    (ormap try-direction DIRECTIONS))
  (for-each move-ant (get-my-ants)))

(define (main)
  (let loop ([map-data '()])
    (match (read)
     ['ready
      (setup map-data)
      (do-setup map-data)
      (finish-turn)
      (loop '())]
     ['go
      (update map-data)
      (do-turn map-data)
      (finish-turn)
      (loop '())]
     [(? eof-object?) (void)]
     [x (loop (cons x map-data))]
     ))
  (close-output-port out))

(main)
