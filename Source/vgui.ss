#lang scheme/gui

;;==========================================================================
;;===                Code generated with MrEd Designer 3.7               ===
;;===                 http://mred-designer.origo.ethz.ch                 ===
;;==========================================================================

;;; Call (project-vortaro-init) with optional arguments to this module

(require
 framework
 )

(provide project-vortaro-init text-field-vorto text-field-trovata gauge-load)

(define (label-bitmap-proc l)
  (let ((label (first l)) (image? (second l)) (file (third l)))
    (or (and image?
             (or (and file
                      (let ((bmp (make-object bitmap% file 'unknown/mask)))
                        (and (send bmp ok?) bmp)))
                 "<Bad Image>"))
        label)))

(define (list->font l)
  (with-handlers
   ((exn:fail?
     (λ (e)
       (send/apply
        the-font-list
        find-or-create-font
        (cons (first l) (rest (rest l)))))))
   (send/apply the-font-list find-or-create-font l)))

(define project-vortaro #f)
(define frame-main #f)
(define menu-bar-1204 #f)
(define menu-2284 #f)
(define menu-item-c #f)
(define menu-item-cap-c #f)
(define menu-item-g #f)
(define menu-item-cap-g #f)
(define menu-item-h #f)
(define menu-item-cap-h #f)
(define menu-item-j #f)
(define menu-item-cap-j #f)
(define menu-item-s #f)
(define menu-item-cap-s #f)
(define menu-item-u #f)
(define menu-item-cap-u #f)
(define message-main-label #f)
(define horizontal-pane-3929 #f)
(define text-field-vorto #f)
(define button-sercxu #f)
(define text-field-trovata #f)
(define gauge-load #f)
(define (project-vortaro-init
         #:menu-bar-1204-demand-callback
         (menu-bar-1204-demand-callback (lambda (m) (void)))
         #:menu-item-c-callback
         (menu-item-c-callback (lambda (item event) (void)))
         #:menu-item-cap-c-callback
         (menu-item-cap-c-callback (lambda (item event) (void)))
         #:menu-item-g-callback
         (menu-item-g-callback (lambda (item event) (void)))
         #:menu-item-cap-g-callback
         (menu-item-cap-g-callback (lambda (item event) (void)))
         #:menu-item-h-callback
         (menu-item-h-callback (lambda (item event) (void)))
         #:menu-item-cap-h-callback
         (menu-item-cap-h-callback (lambda (item event) (void)))
         #:menu-item-j-callback
         (menu-item-j-callback (lambda (item event) (void)))
         #:menu-item-cap-j-callback
         (menu-item-cap-j-callback (lambda (item event) (void)))
         #:menu-item-s-callback
         (menu-item-s-callback (lambda (item event) (void)))
         #:menu-item-cap-s-callback
         (menu-item-cap-s-callback (lambda (item event) (void)))
         #:menu-item-u-callback
         (menu-item-u-callback (lambda (item event) (void)))
         #:menu-item-cap-u-callback
         (menu-item-cap-u-callback (lambda (item event) (void)))
         #:message-main-label-label
         (message-main-label-label
          (label-bitmap-proc
           (list "Konsulta Vortaro" #t "../Resources/label.gif")))
         #:text-field-vorto-callback
         (text-field-vorto-callback (lambda (text-field control-event) (void)))
         #:button-sercxu-callback
         (button-sercxu-callback (lambda (button control-event) (void))))
  (set! frame-main
    (new
     frame%
     (parent project-vortaro)
     (label "Konsulta Vortaro")
     (width #f)
     (height #f)
     (x #f)
     (y #f)
     (style '(metal))
     (enabled #t)
     (border 0)
     (spacing 0)
     (alignment (list 'center 'top))
     (min-width 70)
     (min-height 30)
     (stretchable-width #t)
     (stretchable-height #t)))
  (set! menu-bar-1204
    (new
     menu-bar%
     (parent frame-main)
     (demand-callback menu-bar-1204-demand-callback)))
  (set! menu-2284
    (new
     menu%
     (parent menu-bar-1204)
     (label "&Enigu")
     (help-string "eniga menuo")
     (demand-callback (lambda (m) (void)))))
  (set! menu-item-c
    (new
     menu-item%
     (parent menu-2284)
     (label "ĉ")
     (callback menu-item-c-callback)
     (shortcut #\C)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl))))
  (set! menu-item-cap-c
    (new
     menu-item%
     (parent menu-2284)
     (label "Ĉ")
     (callback menu-item-cap-c-callback)
     (shortcut #\C)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl shift))))
  (set! menu-item-g
    (new
     menu-item%
     (parent menu-2284)
     (label "ĝ")
     (callback menu-item-g-callback)
     (shortcut #\G)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl))))
  (set! menu-item-cap-g
    (new
     menu-item%
     (parent menu-2284)
     (label "Ĝ")
     (callback menu-item-cap-g-callback)
     (shortcut #\G)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl shift))))
  (set! menu-item-h
    (new
     menu-item%
     (parent menu-2284)
     (label "ĥ")
     (callback menu-item-h-callback)
     (shortcut #\H)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl))))
  (set! menu-item-cap-h
    (new
     menu-item%
     (parent menu-2284)
     (label "Ĥ")
     (callback menu-item-cap-h-callback)
     (shortcut #\H)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl shift))))
  (set! menu-item-j
    (new
     menu-item%
     (parent menu-2284)
     (label "ĵ")
     (callback menu-item-j-callback)
     (shortcut #\J)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl))))
  (set! menu-item-cap-j
    (new
     menu-item%
     (parent menu-2284)
     (label "Ĵ")
     (callback menu-item-cap-j-callback)
     (shortcut #\J)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl shift))))
  (set! menu-item-s
    (new
     menu-item%
     (parent menu-2284)
     (label "ŝ")
     (callback menu-item-s-callback)
     (shortcut #\S)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl))))
  (set! menu-item-cap-s
    (new
     menu-item%
     (parent menu-2284)
     (label "Ŝ")
     (callback menu-item-cap-s-callback)
     (shortcut #\S)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl shift))))
  (set! menu-item-u
    (new
     menu-item%
     (parent menu-2284)
     (label "ŭ")
     (callback menu-item-u-callback)
     (shortcut #\U)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl))))
  (set! menu-item-cap-u
    (new
     menu-item%
     (parent menu-2284)
     (label "Ŭ")
     (callback menu-item-cap-u-callback)
     (shortcut #\U)
     (help-string "Item")
     (demand-callback (lambda (item) (void)))
     (shortcut-prefix '(ctl shift))))
  (set! message-main-label
    (new
     message%
     (parent frame-main)
     (label message-main-label-label)
     (style '())
     (font (list->font (list 8 #f 'default 'normal 'normal #f 'default #f)))
     (enabled #t)
     (vert-margin 2)
     (horiz-margin 2)
     (min-width 0)
     (min-height 0)
     (stretchable-width #t)
     (stretchable-height #f)
     (auto-resize #f)))
  (set! horizontal-pane-3929
    (new
     horizontal-pane%
     (parent frame-main)
     (vert-margin 0)
     (horiz-margin 0)
     (border 0)
     (spacing 0)
     (alignment (list 'left 'center))
     (min-width 0)
     (min-height 0)
     (stretchable-width #t)
     (stretchable-height #f)))
  (set! text-field-vorto
    (new
     text-field%
     (parent horizontal-pane-3929)
     (label "Vorto")
     (callback text-field-vorto-callback)
     (init-value "")
     (style
      ((λ (l) (list* (first l) (second l) (third l)))
       (list 'single 'horizontal-label '())))
     (font
      (list->font (list 14 "Arial" 'default 'normal 'normal #f 'default #f)))
     (enabled #t)
     (vert-margin 2)
     (horiz-margin 2)
     (min-width 300)
     (min-height 0)
     (stretchable-width #t)
     (stretchable-height #f)))
  (set! button-sercxu
    (new
     button%
     (parent horizontal-pane-3929)
     (label (label-bitmap-proc (list "Serĉu" #f #f)))
     (callback button-sercxu-callback)
     (style '())
     (font
      (list->font (list 14 "Arial" 'default 'normal 'normal #f 'default #f)))
     (enabled #t)
     (vert-margin 2)
     (horiz-margin 2)
     (min-width 0)
     (min-height 0)
     (stretchable-width #f)
     (stretchable-height #f)))
  (set! text-field-trovata
    (new
     text-field%
     (parent frame-main)
     (label "")
     (callback (lambda (text-field control-event) (void)))
     (init-value "")
     (style
      ((λ (l) (list* (first l) (second l) (third l)))
       (list 'multiple 'horizontal-label '())))
     (font
      (list->font (list 14 "Arial" 'default 'normal 'normal #f 'default #f)))
     (enabled #t)
     (vert-margin 2)
     (horiz-margin 2)
     (min-width 480)
     (min-height 300)
     (stretchable-width #t)
     (stretchable-height #t)))
  (set! gauge-load
    (new
     gauge%
     (parent frame-main)
     (label "")
     (range 100)
     (style
      ((λ (l) (list* (first l) (second l) (third l)))
       (list 'horizontal 'horizontal-label '())))
     (font (list->font (list 8 #f 'default 'normal 'normal #f 'default #f)))
     (enabled #t)
     (vert-margin 2)
     (horiz-margin 2)
     (min-width 0)
     (min-height 0)
     (stretchable-width #t)
     (stretchable-height #f)))
  (send frame-main show #t))
