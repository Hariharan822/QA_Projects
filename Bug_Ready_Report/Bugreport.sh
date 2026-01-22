#!/bin/bash

# --- CONFIGURATION ---
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
VIDEO_NAME="Recording_${TIMESTAMP}.mp4"
BR_NAME="Bugreport_${TIMESTAMP}"
REMOTE_PATH="/sdcard/Download/${VIDEO_NAME}"

echo "================================================"
echo "ADB AUTOMATION: RECORD & BUGREPORT"
echo "================================================"

# 1. Start Recording
echo "Step 1: Start Recording"
read -p "Press [ENTER] to START recording..."
echo "Recording... (The script is now waiting for you)"

# Start recording in background and hide output
adb shell "screenrecord $REMOTE_PATH" > /dev/null 2>&1 &

# 2. Stop Recording
read -p "Press [ENTER] again to STOP recording..."

# Find the process ID on the Android device and kill it
adb shell "pkill -2 screenrecord"

echo "Stopping recording and finalizing file..."
sleep 3 # Vital to let the device finish writing the MP4 header

# 3. Trigger Bugreport
echo ""
echo "Step 2: Generating Bugreport"
echo "This covers the timeframe of your recording. Please wait..."
# We save the bugreport directly to your computer
adb bugreport "${BR_NAME}.zip"

# 4. Pull Video and Cleanup
echo ""
echo "Step 3: Pulling Video File"
adb pull "$REMOTE_PATH" .
adb shell rm "$REMOTE_PATH"

echo "================================================"
echo "COMPLETED"
echo "Video:     $VIDEO_NAME"
echo "Bugreport: ${BR_NAME}.zip"
echo "================================================"


