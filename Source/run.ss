#lang scheme/gui

(require (prefix-in gui: "vgui.ss"))
(require (prefix-in konsult: "search.ss"))


;; gauge callback
(define gauge-callback
  (λ (cur max)
    (let ((value (floor (/ (* cur 100) max))))
      (send gui:gauge-load set-value value))))

;; insertion menu
(define factory-insert
  (λ (*letter*)
    (λ (item event)
      (let ((editor (send gui:text-field-vorto get-editor)))
        (send editor insert *letter*)))))

;; search callback for button click
(define search-callback
  (λ (control control-event)
    (let ((search-chunk (send gui:text-field-vorto get-value)))
      (send gui:text-field-trovata
            set-value (konsult:search-word search-chunk
                                           #:gauge gauge-callback)))
    (let ((editor (send gui:text-field-trovata get-editor)))
      (send editor scroll-editor-to 0 0 0 0 #t 'start))
    (gauge-callback 0 1)))

;; search callback for enter press
(define text-search-callback
  (λ (control control-event)
    (when (equal? (send control-event get-event-type) 'text-field-enter)
      (search-callback control control-event))))


;; update dictionary
(define update-callback
  (λ (item event)
    (send gui:text-field-trovata
          set-value "atendu - aguarde - espere")
    (send gui:text-field-trovata
          set-value (symbol->string (konsult:update-dict)))))


;; start mainloop
(gui:project-vortaro-init
 
 #:button-sercxu-callback
 search-callback
 
 #:text-field-vorto-callback
 text-search-callback
 
 #:menu-item-nunigu-callback
 update-callback
 
 #:menu-item-c-callback
 (factory-insert "ĉ")
 
 #:menu-item-cap-c-callback
 (factory-insert "Ĉ")
 
 #:menu-item-g-callback
 (factory-insert "ĝ")
 
 #:menu-item-cap-g-callback
 (factory-insert "Ĝ")
 
 #:menu-item-h-callback
 (factory-insert "ĥ")
 
 #:menu-item-cap-h-callback
 (factory-insert "Ĥ")
 
 #:menu-item-j-callback
 (factory-insert "ĵ")
 
 #:menu-item-cap-j-callback
 (factory-insert "Ĵ")
 
 #:menu-item-s-callback
 (factory-insert "ŝ")
 
 #:menu-item-cap-s-callback
 (factory-insert "Ŝ")
 
 #:menu-item-u-callback
 (factory-insert "ŭ")
 
 #:menu-item-cap-u-callback
 (factory-insert "Ŭ")
 
 #:message-main-label-label
 (make-object bitmap%
   (path->string (build-path konsult:resources "label.gif"))
   'gif/alpha))
