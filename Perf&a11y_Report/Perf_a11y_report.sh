#!/bin/bash

# 1. Detect the package name
PACKAGE_NAME=$(adb shell dumpsys window | grep -E 'mCurrentFocus' | cut -d'/' -f1 | rev | cut -d' ' -f1 | rev)

if [ -z "$PACKAGE_NAME" ] || [ "$PACKAGE_NAME" == "null" ]; then
    echo "Error: Could not detect an active app. Ensure the screen is on."
    exit 1
fi

# Create a timestamp to keep screenshots and reports organized
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
SCREENSHOT_NAME="Screenshot_${PACKAGE_NAME}_${TIMESTAMP}.png"

echo "Detected Active App: $PACKAGE_NAME"
echo "Capturing Screenshot: $SCREENSHOT_NAME"

# 2. Capture and Pull Screenshot
adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png "./$SCREENSHOT_NAME" > /dev/null

{
  echo "==============================================="
  echo "PERFORMANCE & A11Y REPORT"
  echo "DATE: $(date)"
  echo "DEVICE: $(adb shell getprop ro.product.model)"
  echo "APP UNDER TEST: $PACKAGE_NAME"
  echo "SCREENSHOT: $SCREENSHOT_NAME"
  echo "==============================================="
  
  echo -e "\n[1] GRAPHICS PERFORMANCE (GFXINFO)"
  adb shell dumpsys gfxinfo "$PACKAGE_NAME"
  
  echo -e "\n[2] ACCESSIBILITY & VIEW HIERARCHY"
  adb shell uiautomator dump --compressed false /sdcard/health.xml > /dev/null
  adb pull /sdcard/health.xml . > /dev/null
  
  NODE_COUNT=$(grep -c "<node" health.xml)
  echo "Total UI Nodes: $NODE_COUNT"
  
  echo -e "\n[3] CRITICAL A11Y BUG: UNLABELED CLICKABLE ELEMENTS"
  # This finds elements where clickable is true but content-desc is empty
  grep 'clickable="true"' health.xml | grep 'content-desc=""' || echo "None found."
  
  echo -e "\n[4] SYSTEM MEMORY STATE"
  adb shell dumpsys meminfo "$PACKAGE_NAME" -d | head -n 20
  
  rm health.xml
  adb shell rm /sdcard/screen.png
} > "Report_${PACKAGE_NAME}_${TIMESTAMP}.csv"

echo "Success! Report and Screenshot saved."


