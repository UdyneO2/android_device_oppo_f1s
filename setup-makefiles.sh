#!/bin/sh

VENDOR=oppo
DEVICE=f1s
OUTDIR=vendor/$VENDOR/$DEVICE
MAKEFILE=../../../$OUTDIR/$DEVICE-vendor-blobs.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
#COUNT=`cat proprietary-files.txt | grep -v ^# | grep -v ^$ | wc -l | awk {'print $1'}`
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$ | cut -d '#' -f 1`; do
#    COUNT=`expr $COUNT - 1`
#    if [ $COUNT = "0" ]; then
#        LINEEND=""
#    fi
    mymodule=`cat proprietary-files.txt | grep $FILE | grep "#.*MODULE" | grep -o MODULE`
    if [ -n "$mymodule" ]; then
      echo "$FILE is a module, skip it"
    else
      echo "    $OUTDIR/proprietary/$FILE:system/$FILE$LINEEND" >> $MAKEFILE
    fi
done
echo "# end of blobs" >> $MAKEFILE

# ---------------------------------------------------------------

(cat << EOF) > ../../../$OUTDIR/$DEVICE-vendor.mk
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

\$(call inherit-product, vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk)
EOF

# ---------------------------------------------------------------

(cat << EOF) > ../../../$OUTDIR/BoardConfigVendor.mk
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh
EOF

# ---------------------------------------------------------------

(cat << EOF) > ../../../$OUTDIR/Android.mk
# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh
LOCAL_PATH:= \$(call my-dir)
ifeq (\$(TARGET_DEVICE),$DEVICE)

include \$(call first-makefiles-under,\$(LOCAL_PATH)) 

endif
EOF

# ---------------------------------------------------------------

mkdir ../../../$OUTDIR/prebuilt
mkdir ../../../$OUTDIR/prebuilt/proprietary

cp -r ../m3_m3s-common/prebuilt/lib ../../../$OUTDIR/prebuilt/proprietary
cp -r ../m3_m3s-common/prebuilt/lib64 ../../../$OUTDIR/prebuilt/proprietary

(cat << EOF) > ../../../$OUTDIR/prebuilt/Android.mk
# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh
LOCAL_PATH:= \$(call my-dir)

ifeq (\$(TARGET_DEVICE),$DEVICE)

PROPRIETARY_PATH:= proprietary

include \$(CLEAR_VARS)
LOCAL_MODULE        := libcfgdevparam
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES_64  := \$(PROPRIETARY_PATH)/lib64/libcfgdevparam.so
LOCAL_SRC_FILES_32  := \$(PROPRIETARY_PATH)/lib/libcfgdevparam.so
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE        := libmeizucamera
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES_64  := \$(PROPRIETARY_PATH)/lib64/libmeizucamera.so
LOCAL_SRC_FILES_32  := \$(PROPRIETARY_PATH)/lib/libmeizucamera.so
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE        := libperfservice
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES_64  := \$(PROPRIETARY_PATH)/lib64/libperfservice.so
LOCAL_SRC_FILES_32  := \$(PROPRIETARY_PATH)/lib/libperfservice.so
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

endif
EOF

# ---------------------------------------------------------------
