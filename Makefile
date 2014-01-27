THEOS_DEVICE_IP = 192.168.1.66

include theos7/makefiles/common.mk

ARCHS = armv7 arm64

BUNDLE_NAME = MatchInMusic
MatchInMusic_FILES = Switch.x
MatchInMusic_FRAMEWORKS = UIKit
MatchInMusic_LIBRARIES = flipswitch
MatchInMusic_INSTALL_PATH = /Library/Switches

include theos7/makefiles/bundle.mk
include theos7/makefiles/library.mk

internal-after-install::
	install.exec "killall -9 backboardd"