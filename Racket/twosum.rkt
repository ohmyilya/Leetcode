(define (two-sum nums target)
  (define num-to-index (make-hash))
  (for ([num (in-list nums)]
        [index (in-naturals)])
    (define complement (- target num))
    (define complement-index (hash-ref num-to-index complement #f))
    (if complement-index
        (list complement-index index)
        (hash-set! num-to-index num index)))
  '()) ; Return an empty list if no solution is found.
