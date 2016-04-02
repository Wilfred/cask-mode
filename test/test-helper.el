(require 'f)

(defvar cask-mode-test--test-path
  (f-parent (f-this-file)))

(defvar cask-mode-test--root-path
  (f-parent cask-mode-test--test-path))

(require 'ert)
(require 'cask-mode (f-expand "cask-mode" cask-mode-test--root-path))
