#!/bin/bash

# Define the target package
TARGET_PKG="com.google.android.gms"

# Check if a device is connected
DEVICE_ID=$(adb devices | grep -v "List" | awk '{print $1}' | head -n 1)

if [ -z "$DEVICE_ID" ]; then
    echo "Error: No device found. Please connect a device via USB."
    exit 1
fi

# Fetching Data into variables
MANUFACTURER=$(adb shell getprop ro.product.manufacturer)
MODEL=$(adb shell getprop ro.product.model)
DEVICE_NAME=$(adb shell getprop ro.product.name)
OS_VER=$(adb shell getprop ro.build.version.release)
BUILD_NUM=$(adb shell getprop ro.build.display.id)
SERIAL=$(adb shell getprop ro.serialno)

# --- REFINED EXTRACTION ---
# 1. Dump to file
adb shell "dumpsys package $TARGET_PKG > /data/local/tmp/pkg.txt"

# 2. Extract ONLY the first occurrence of each (latest version)
# We use 'grep' to find the line and 'head -n 1' to ignore older rollback versions
V_CODE=$(adb shell "grep 'versionCode' /data/local/tmp/pkg.txt | head -n 1")
V_NAME=$(adb shell "grep 'versionName' /data/local/tmp/pkg.txt | head -n 1")

# 3. Cleanup
adb shell "rm /data/local/tmp/pkg.txt"
# -------------------------

# Outputting the results
echo "================================================"
echo "DEVICE INFORMATION"
echo "================================================"
echo "Manufacturer:  $MANUFACTURER"
echo "Model:         $MODEL"
echo "Device Name:   $DEVICE_NAME"
echo "Serial:        $SERIAL"
echo "Android Ver:   $OS_VER"
echo "Build Number:  $BUILD_NUM"
echo "------------------------------------------------"
echo "PACKAGE DETAILS: $TARGET_PKG"
echo "------------------------------------------------"

if [ -z "$V_NAME" ]; then
    echo "Status: Package not found."
else
    # Output the full lines exactly as they appear in the system
    echo "$V_CODE" | sed 's/^[[:space:]]*//'
    echo "$V_NAME" | sed 's/^[[:space:]]*//'
fi
echo "================================================"


