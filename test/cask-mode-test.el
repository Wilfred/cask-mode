(require 'ert)
(require 'cask-mode)

(ert-deftest cask-mode-toggle-comment ()
  "We should be able to toggle comments."
  (with-temp-buffer
    (insert "(source melpa)")
    (cask-mode)
    (mark-whole-buffer)
    (comment-dwim nil)
    (should (equal (buffer-string) ";; (source melpa)"))))
