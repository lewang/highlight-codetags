;;; highlight-codetags.el --- highlight codetags -*- lexical-binding: t; -*-

;; Copyright (C) Le Wang

;; Author: Le Wang
;; Version: 0.0
;; Package-Requires: ((emacs "30.1"))
;; Keywords: matching
;; URL: https://
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:


;;; Code:


(provide 'highlight-codetags)

(defvar highlight-codetags-keywords
  '(("\\<\\(TODO\\|FIXME\\|BUG\\|XXX\\)\\>" 1 font-lock-warning-face prepend)
    ("\\<\\(NOTE\\|HACK\\)\\>" 1 font-lock-doc-face prepend)))

;;;###autoload
(define-minor-mode highlight-codetags-mode
  "Highlight codetags like TODO, FIXME..."
  :global t
  (if le-highlight-codetags-mode
      (font-lock-add-keywords nil le-highlight-codetags-keywords)
    (font-lock-remove-keywords nil le-highlight-codetags-keywords))

  ;; Fontify the current buffer
  (when (bound-and-true-p font-lock-mode)
    (if (fboundp 'font-lock-flush)
        (font-lock-flush)
      (with-no-warnings (font-lock-fontify-buffer)))))
