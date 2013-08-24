PRODUCT_BRAND ?= custom

# bootanimation
PRODUCT_COPY_FILES += \
	vendor/custom/bootanimation.zip:system/media/bootanimation.zip

# general properties
PRODUCT_PROPERTIES_OVERRIDE += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false \
	persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# init.d support
PRODUCT_COPY_FILES += \
	vendor/custom/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
	vendor/custom/prebuilt/bin/sysinit:system/bin/sysinit

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/custom/config/packages.mk

# Versionning
-include vendor/custom/config/version.mk
