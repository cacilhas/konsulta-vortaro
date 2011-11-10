#lang racket

(provide search-word resources update-dict)
(require net/url)


(define resources
  (let-values (((dirname basename _)
                (split-path (path->complete-path (find-system-path 'run-file)))))
    (if (regexp-match? "[Rr]acket$" basename)
        (build-path ".." "Resources")
        (build-path dirname ".." "Resources"))))


(define remote-dict-url
  (string->url
   "https://gitorious.org/vortaro/vortaro/blobs/raw/master/Resources/vortaro.text"))


(define dict-path
  (build-path resources "vortaro.text"))


(define lines-count
  (let ((fd (open-input-file dict-path))
        (count 0))
    (let loop ((line (read-line fd)) (count 0))
      (if (eof-object? line)
          (begin
            (close-input-port fd)
            count)
          (loop (read-line fd) (+ count 1))))))


(define search-word
  (λ (*word* #:gauge (gauge (λ (cur max) (void))))
    (let ((fd (open-input-file dict-path))
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


;; TODO: How to test this?
(define update-dict
  (λ ()
    (let ((fd-in (get-pure-port remote-dict-url)))
      (when (input-port? fd-in)
        (let ((fd-out (open-output-file dict-path #:exists 'truncate/replace)))
          (let loop ((line (read-line fd-in)))
            (if (eof-object? line)
                (begin
                  (close-input-port fd-in)
                  (close-output-port fd-out))
                (begin
                  (displayln line fd-out)
                  (loop (read-line fd-in))))))))
    'done))
