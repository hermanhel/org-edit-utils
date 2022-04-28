(defun hermanhel/org-insert-clipboard-image (img-filename)
  "save clipboard image in ./resource/buffer-filname/img-filname.png, and insert a link to it at point"
             (interactive
              (list (read-string "[filename].png:")))
             (let* ((cur-file
                    (car (split-string
                          (car (last
                                (split-string buffer-file-name "/")))
                          "\\.")))
                   (resource (concat "./resource/" cur-file "/")))
               (when (not(file-directory-p resource))
                 (make-directory resource))
               (shell-command (concat "pngpaste " resource img-filename ".png"))
               (insert "#+attr_html: :width 600px \n#+ATTR_ORG: :width 600\n") ;; default 900 width.
               (insert  (concat "[[" resource img-filename ".png" "]]"))
               (org-display-inline-images)
               ))
(provide 'hermanhel/org-edit-utils)
