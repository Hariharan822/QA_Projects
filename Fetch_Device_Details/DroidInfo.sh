#!/bin/bash

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
echo "================================================"


