
# Android Device Information Fetch Script

## Overview
This Bash script retrieves essential Android device information using **ADB (Android Debug Bridge)**.  
It is useful for QA engineers, developers, and support teams who need quick visibility into connected device details during testing, debugging, or validation activities.

## Features
- Detects whether an Android device is connected via USB
- Fetches and displays:
  - Manufacturer
  - Model
  - Device name
  - Serial number
  - Android OS version
  - Build number
- Fails gracefully if no device is detected

## Prerequisites
Before running the script, ensure the following:
- **ADB** is installed and added to your system `PATH`
- USB debugging is enabled on the Android device
- Device is authorized for ADB access
- Bash shell environment (Linux, macOS, or Git Bash on Windows)

## Script Details
The script performs the following steps:
1. Checks for a connected Android device using `adb devices`
2. Exits with an error message if no device is found
3. Uses `adb shell getprop` to fetch device properties
4. Prints formatted device information to the console

## Usage
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ````

2. Navigate to the script directory:

   ```bash
   cd <repository-folder>
   ```
3. Grant execute permission:

   ```bash
   chmod +x device_info.sh
   ```
4. Run the script:

   ```bash
   ./device_info.sh
   ```

## Sample Output

```
================================================
DEVICE INFORMATION
================================================
Manufacturer:  Samsung
Model:         SM-G991B
Device Name:   o1s
Serial:        R58NXXXXXXXX
Android Ver:   13
Build Number:  TP1A.220624.014
================================================
```

## Use Cases

* Mobile test environment validation
* Device inventory tracking
* Debugging and support analysis
* Automation pre-checks in CI/CD pipelines

## Limitations

* Supports only one connected device at a time
* Requires physical or emulator-based device connection
* Depends on ADB availability and permissions

## License

This project is open for personal and educational use.
You may modify and distribute it as needed.

## Author

Created for practical Android testing and device diagnostics.

```

---
