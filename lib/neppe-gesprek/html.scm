;;; Neppe Gesprek

;; Copyright © 2024 "Josep Bigorra" known as "jjba23" <jjbigorra@gmail.com>

;; neppe-gesprek is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; neppe-gesprek is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with neppe-gesprek.  If not, see <https://www.gnu.org/licenses/>.

(define-module (neppe-gesprek html)
  #:use-module (artanis artanis)
  #:use-module (artanis route)
  #:use-module (web server)
  #:use-module (web request)
  #:use-module (web response)
  #:use-module (web uri)
  #:use-module (sxml simple)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 textual-ports)
  #:use-module (ice-9 time)
  #:use-module (ice-9 format)
  #:use-module (ice-9 string-fun)
  #:use-module (ice-9 iconv)
  #:use-module (ice-9 threads))

(define (neppe-gesprek-html-template title body)
  `(html
    (head
     (title ,title)
     (link (@(rel "preconnect")
            (href "https://fonts.googleapis.com")))
     (link (@(rel "preconnect")
            (href "https://fonts.gstatic.com")(crossorigin "")))
     (link (@(rel "stylesheet")
            (href "https://fonts.cdnfonts.com/css/liberation-sans")))

     (meta (@(name "viewport")
            (content "width=device-width, initial-scale=1.0")))
     (script (@(src "https://cdn.tailwindcss.com")) "")
     (script (@(src "/js/tailwind.config.js")) ()))
    (body (@(class "bg-stone-200"))
          (div (@(class "container mx-auto my-4"))
               ,@body
               ,(page-footer)))))



(define-public (welcome-page)
  (neppe-gesprek-html-template
   "neppe-gesprek"
   `(html
     (h2 (@(class "text-2xl font-bold text-stone-800")) "Neppe Gesprek")
     (div (@(class "w-full rounded-xl bg-stone-300 text-stone-800 p-4 flex flex-col gap-4 align-center my-6"))
          (p "Welcome to Neppe Gesprek! Select one the options below to start a scene: ")))))

(define-public (page-footer)
  `((div (@(class "block text-center font-sans"))
         (p (@(class "text-md text-stone-800")) "Neppe Gesprek allows you to easily stage chat scenes.")
         (p (@(class "text-md text-stone-800")) "This project is free software, licensed under the GNU General Public License v3 or later")
         (div (@(class "mt-4 flex flex-row flex-wrap gap-4 justify-center align-center"))
              (p (@(class "text-sm text-stone-800")) "find the source code here:")
              (a (@(class "text-green-900 font-bold cursor-pointer text-sm")
                  (href "https://codeberg.org/jjba23/neppe-gesprek"))
                 "https://codeberg.org/jjba23/neppe-gesprek")
              )
         (p (@(class "mt-4"))
            (em (@(class "text-md text-stone-700"))
                "Copyright 2024 - Josep Bigorra"))
         (p (@(class "mt-4"))
            (span (@(class "text-sm text-stone-700"))
                  "Neppe Gesprek means fake conversation in the Dutch language")))))
