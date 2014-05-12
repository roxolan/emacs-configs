;; package for android sdk/ndk toolchain 

(req-package android-mode
  :init (setq android-mode-sdk-dir (getenv "ANDROID_SDK")))

(provide 'init-android)
