;;; Neppe Gesprek - easily stage conversation scenes

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

(define-artanis-controller index)

(import (neppe-gesprek html))

(get "/"
     #:mime 'xml
     (lambda (rc)
       (response-emit (:mime rc (welcome-page)))))
