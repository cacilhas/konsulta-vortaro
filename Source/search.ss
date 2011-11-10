#lang racket

(provide search-word resources)


(define resources
  (let-values (((dirname basename _)
                (split-path (path->complete-path (find-system-path 'run-file)))))
    (if (regexp-match? "[Rr]acket$" basename)
        (build-path ".." "Resources")
        (build-path dirname ".." "Resources"))))


(define lines-count
  (let ((fd (open-input-file (build-path resources "vortaro.text")))
        (count 0))
    (let loop ((line (read-line fd)) (count 0))
      (if (eof-object? line)
          (begin
            (close-input-port fd)
            count)
          (loop (read-line fd) (+ count 1))))))


(define search-word
  (λ (*word* #:gauge (gauge (λ (cur max) (void))))
    (let ((fd (open-input-file (build-path resources "vortaro.text")))
          (search-this (regexp *word*)))
      (string-join (let loop ((line (read-line fd))
                              (count 0)
                              (response '()))
                     (gauge count lines-count)
                     (if (eof-object? line)
                         (begin
                           (close-input-port fd)
                           response)
                         (loop (read-line fd)
                               (+ count 1)
                               (if (regexp-match? search-this line)
                                   (append response
                                           (list (regexp-replace* #rx"\t::"
                                                                  line
                                                                  "\n\t")))
                                   response))))
                   "\n"))))
