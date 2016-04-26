(require 'ert)
(require 'assess)
(require 'cask-mode)

(ert-deftest cask-mode-toggle-comment ()
  "We should be able to toggle comments."
  (with-temp-buffer
    (insert "(source melpa)")
    (cask-mode)

    (transient-mark-mode)
    (mark-whole-buffer)
    (comment-dwim nil)
    (should (equal (buffer-string) ";; (source melpa)"))))

(ert-deftest cask-mode-highlight-comment ()
  (should (assess-face-at=
           "; foo\nbar"
           'cask-mode
           '("; foo" "bar")
           '(font-lock-comment-face nil))))

(ert-deftest cask-mode-highlight-keywords ()
  (should (assess-face-at=
           "(package \"ecukes\" \"0.2.1\" \"Cucumber for Emacs.\")"
           'cask-mode
           "package"
           'font-lock-keyword-face)))

(ert-deftest cask-mode-highlight-sources ()
  "Ensure we highlight known values for source."
  (should (assess-face-at=
           "(source melpa)"
           'cask-mode
           "melpa"
           'cask-mode-source-face)))

(ert-deftest cask-mode-dont-highlight-source-substring ()
  "Ensure that \"nongnu\" is not highlighted, even though \"gnu\"
is a known source."
  (should (assess-face-at=
           "(source nongnu)"
           'cask-mode
           "gnu"
           '(nil))))

(ert-deftest cask-mode-highlight-known-symbols ()
  (should (assess-face-at=
           "(depends-on dash :git \"git://example.com\")"
           'cask-mode
           ":git"
           'cask-mode-symbol-face)))

;; TODO: `assess-with-preserved-buffer-list' is used before definition
;; in assess.el, so we should file a bug.
;; (should (assess-indentation= 'fundamental-mode "foo" "bar"))
;; casues an error.

(ert-deftest cask-mode-indent-inside-development ()
  "Ensure we correctly indent inside (development ...) blocks."
  (should (assess-indentation=
           'cask-mode
           "(development\n(depends-on \"foo\"))"
           "(development\n (depends-on \"foo\"))")))
