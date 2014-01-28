#ipt4g - .1.66
#ip5s  - .2.116
#ipad  - .2.113
THEOS_DEVICE_IP = 192.168.0.135

include theos/makefiles/common.mk

ARCHS = armv7 arm64

BUNDLE_NAME = MatchInMusic
MatchInMusic_FILES = Switch.x
MatchInMusic_FRAMEWORKS = UIKit
MatchInMusic_LIBRARIES = flipswitch
MatchInMusic_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/library.mk

internal-after-install::
	install.exec "killall -9 backboardd"