#!/bin/bash

# Check for device
DEVICE_ID=$(adb devices | grep -v "List" | awk '{print $1}' | head -n 1)
if [ -z "$DEVICE_ID" ]; then
    echo "Error: No device found. Please connect via USB."
    exit 1
fi

echo "Generating Comprehensive Device Audit..."

# 1. CORE IDENTITY
MFR=$(adb shell getprop ro.product.manufacturer)
MODEL=$(adb shell getprop ro.product.model)
SERIAL=$(adb shell getprop ro.serialno)
OS=$(adb shell getprop ro.build.version.release)
SDK=$(adb shell getprop ro.build.version.sdk)
PATCH=$(adb shell getprop ro.build.version.security_patch)
CPU=$(adb shell getprop ro.product.cpu.abi)

# 2. NETWORK & CONNECTIVITY
IP_ADDR=$(adb shell "ip addr show wlan0 2>/dev/null | grep 'inet ' | cut -d/ -f1 | awk '{print \$2}'")
[ -z "$IP_ADDR" ] && IP_ADDR="Disconnected/No WiFi"
MAC=$(adb shell "cat /sys/class/net/wlan0/address 2>/dev/null || echo 'Unknown'")

# 3. HARDWARE HEALTH
BATTERY=$(adb shell dumpsys battery | grep 'level' | awk '{print $2}')"%"
TEMP=$(adb shell dumpsys battery | grep 'temperature' | awk '{print $2 / 10}')"°C"
RES=$(adb shell dumpsys display | grep 'mBaseDisplayInfo' | head -n 1 | grep -oE '[0-9]+ x [0-9]+')
UPTIME=$(adb shell uptime | awk '{print $3,$4}' | sed 's/,//')

# 4. SECURITY AUDIT (RISK PARAMETERS)
SELINUX=$(adb shell getenforce)
ROOTED=$(adb shell "which su > /dev/null && echo 'POTENTIALLY ROOTED' || echo 'NOT DETECTED'")
LOCKED=$(adb shell getprop ro.boot.flash.locked)
DEBUG=$(adb shell getprop ro.debuggable)
VERIFY=$(adb shell getprop ro.build.tags)
# Check if "Install Unknown Sources" is enabled
UNKNOWN_SRC=$(adb shell settings get global install_non_market_apps)

# --- OUTPUT REPORT ---
echo "================================================"
echo "          COMPREHENSIVE DEVICE AUDIT"
echo "================================================"
echo "IDENTIFICATION"
echo "Manufacturer:    $MFR"
echo "Model:           $MODEL"
echo "Serial:          $SERIAL"
echo "CPU Arch:        $CPU"
echo "------------------------------------------------"
echo "SOFTWARE & SYSTEM"
echo "Android Ver:     $OS (API $SDK)"
echo "Security Patch:  $PATCH"
echo "Uptime:          $UPTIME"
echo "------------------------------------------------"
echo "NETWORK STATUS"
echo "IP Address:      $IP_ADDR"
echo "MAC Address:     $MAC"
echo "------------------------------------------------"
echo "HARDWARE VITALS"
echo "Battery Level:   $BATTERY"
echo "Battery Temp:    $TEMP"
echo "Resolution:      $RES"
echo "------------------------------------------------"
echo "SECURITY RISK ASSESSMENT"
echo "SELinux Mode:    $SELINUX (Enforcing is Safe)"
echo "Root Status:     $ROOTED"
echo "Bootloader:      $( [ "$LOCKED" == "0" ] && echo "UNLOCKED (High Risk)" || echo "LOCKED (Safe)" )"
echo "Build Tags:      $VERIFY ($( [ "$VERIFY" == "release-keys" ] && echo "Official" || echo "Custom/Risk" ))"
echo "Debuggable:      $( [ "$DEBUG" == "1" ] && echo "YES (High Risk)" || echo "NO (Safe)" )"
echo "Unknown Sources: $( [ "$UNKNOWN_SRC" == "1" ] && echo "ENABLED (Risk)" || echo "DISABLED" )"
echo "================================================"