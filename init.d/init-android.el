(require 'req-package)

;; package for android sdk/ndk toolchain

(req-package android-mode
  :disabled t
  :config (setq android-mode-sdk-dir (getenv "ANDROID_SDK")))

(provide 'init-android)
