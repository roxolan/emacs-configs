(require 'req-package)

(if (eq system-type 'darwin)
    (progn (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
		   (setenv "LANG" "en_US.UTF-8")
		   (setenv "LC_ALL" "en_US.UTF-8")
		   (setenv "LC_ALL" "en_US.UTF-8")
		   (setenv "ANDROID_SDK" "/usr/local/opt/android-sdk")
		   (setenv "ANDROID_HOME" "/usr/local/opt/android-sdk")
		   (setenv "ANDROID_NDK" "/usr/local/opt/android-ndk")
           (add-to-list 'exec-path "/usr/local/bin")

           (set-default-font "SourceCodePro-12" t)
           (set-fontset-font "fontset-default" 'cyrillic-iso8859-5 '("Monaco-12" . "iso10646-1"))))

(provide 'init-darwin)
