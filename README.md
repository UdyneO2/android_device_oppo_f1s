# android_device_oppo_f1s
Device repository for Oppo f1s (CyanogenMod)

Install
-----------

1. Clone [https://github.com/UdyneO2/android_device_oppo_f1s/] into **device/oppo/f1_f1s-common**

2. Apply patches

```
cd device/oppo/f1_f1s-common/patches
bash apply.sh
``` 

3. Compile

```
. build/envsetup.sh
lunch cm_f1s-userdebug
mka bacon
```
## v0.2
- Full rebase device tree
- Beta test
