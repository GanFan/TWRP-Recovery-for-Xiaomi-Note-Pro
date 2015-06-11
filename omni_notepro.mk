## Specify phone tech before including full_phone

# Inherit device configuration

## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
#If you are using Omnirom, change it to Omnirom common vendor
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/notepro/device_notepro.mk)

# Release name
PRODUCT_RELEASE_NAME := xiaomi_notepro

# Inherit some common DU stuff.

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := notepro
PRODUCT_NAME := omni_notepro
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Note Pro
PRODUCT_MANUFACTURER := Xiaomi

