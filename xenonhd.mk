# Inherit from those products. Most specific first.		
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from m7-common
$(call inherit-product, device/htc/m7-common/m7-common.mk)

# Inherit full phone configuration
$(call inherit-product, vendor/xenonhd/config/common_full_phone.mk)

# Get non-open-source specific aspects		
$(call inherit-product, vendor/htc/m7vzw/m7vzw-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/m7vzw/overlay

#enable SuperSU
WITH_SUPERSU := true
ROOT_METHOD=magisk

PRODUCT_PACKAGES += \
    AdAway \
    KernelAdiutor \
    MiXplorer

# Set those variables here to overwrite the inherited values.
PRODUCT_BRAND := htc
PRODUCT_DEVICE := m7vzw
PRODUCT_MANUFACTURER := HTC
PRODUCT_MODEL := One
PRODUCT_NAME := xenonhd_m7vzw

PRODUCT_PROPERTY_OVERRIDES += ro.xenonhd.maintainer=ljjehl

# Override build props
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="htc/m7_google/m7:5.1/LMY47O.H18/666675:user/release-keys" \
    BUILD_ID=LMY47O.H18 \
    PRIVATE_BUILD_DESC="6.04.1700.18 CL536258 release-keys"
endif
