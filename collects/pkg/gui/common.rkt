#lang racket/base
(require racket/class
         racket/gui/base
         string-constants
         racket/format)

(provide really-remove?
         sc-install-pkg-remove
	 pick-wider)

(define sc-install-pkg-remove (string-constant install-pkg-remove))
(define really-uninstall?-msg (string-constant install-pkg-really-remove?))

(define (really-remove? #:parent [parent #f] names)
  (equal? 1
          (message-box/custom sc-install-pkg-remove
                              (apply ~a
                                     really-uninstall?-msg
                                     (for/list ([n (in-list names)])
                                       (~a "\n  " n)))
                              sc-install-pkg-remove
                              (string-constant cancel)
                              #f
                              parent
                              '(caution default=1))))

(define (pick-wider font a b)
  (define-values (wa ha) (get-window-text-extent a font))
  (define-values (wb hb) (get-window-text-extent b font))
  (if (wa . > . wb)
      a
      b))
