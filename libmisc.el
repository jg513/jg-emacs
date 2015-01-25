
;; Copyright (C) Jin Gan <jg_513@163.com>

(defun switch-recent-buffer ()
  "Switch to other buffer. This function is used to switch between the last
two buffers."
  (interactive)
  (switch-to-buffer (other-buffer "*Ibuffer*")))

(defun comment-dwim (arg)
  "Call the comment command you want (Do What I Mean).
If the region is active and `transient-mark-mode' is on, call
  `comment-region' (unless it only consists of comments, in which
  case it calls `uncomment-region').
Else, if the current line is empty, call `comment-insert-comment-function'
if it is defined, otherwise insert a comment and indent it.
Else if a prefix ARG is specified, call `comment-kill'.
Else, call `comment-indent'.
You can configure `comment-style' to change the way regions are commented."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and mark-active transient-mark-mode)
      (save-excursion
        (let* ((mark-beg (region-beginning))
               (mark-end (region-end))
               (beg (progn (goto-char mark-beg)
                           (line-beginning-position)))
               (end (progn (goto-char mark-end)
                           (line-end-position))))
          (comment-or-uncomment-region beg end arg)))
    (if (save-excursion
          (re-search-forward "\\S-" (line-end-position) t))
        (comment-or-uncomment-region (line-beginning-position)
                                     (line-end-position))
      (if (save-excursion
            (re-search-backward "[^\\s-]" (line-beginning-position) t))
          ;; (beginning-of-line) (not (looking-at "\\s-*$")))
          ;; FIXME: If there's no comment to kill on this line and ARG is
          ;; specified, calling comment-kill is not very clever.
          (if arg (comment-kill (and (integerp arg) arg)) (comment-indent))
        ;; Inserting a comment on a blank line. comment-indent calls
        ;; c-i-c-f if needed in the non-blank case.
        (if comment-insert-comment-function
            (funcall comment-insert-comment-function)
          (let ((add (comment-add arg)))
            ;; Some modes insist on keeping column 0 comment in column 0
            ;; so we need to move away from it before inserting the comment.
            (indent-according-to-mode)
            (insert (comment-padright comment-start add))
            (save-excursion
              (unless (string= "" comment-end)
                (insert (comment-padleft comment-end add)))
              (indent-according-to-mode))))))))

(provide 'libmisc)
