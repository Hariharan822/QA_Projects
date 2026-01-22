
Android Performance & Accessibility CLI Tool
A lightweight ADB-based CLI Bash utility to capture performance metrics, accessibility insights, memory usage, and screenshots of the currently active Android application.
This tool is intended for QA Engineers, SDETs, Accessibility Testers, and Android Test Leads who require quick diagnostics without relying on full automation frameworks.

Features
Automatically detects the foreground Android application package
Captures a timestamped screenshot
Generates a consolidated Performance & Accessibility report
Collects:
Graphics performance metrics (GFXInfo)
UI hierarchy dump and total UI node count
Detection of unlabeled clickable elements (critical accessibility issue)
Application memory usage snapshot
Outputs organized, timestamped artifacts for easy traceability

Generated Output
Each execution produces the following files in the current directory:
Screenshot_<package_name>_<timestamp>.png
Report_<package_name>_<timestamp>.csv

Prerequisites
Ensure the following are installed and configured:
macOS / Linux / Windows (Git Bash or WSL)
Android SDK with ADB available in system PATH
At least one Android device or emulator connected
USB debugging enabled on the device
Verify device connection:
adb devices


How It Works
Detects the currently active app using dumpsys window
Captures a device screenshot
Collects graphics performance using dumpsys gfxinfo
Dumps UI hierarchy using uiautomator
Identifies clickable elements without accessibility labels
Captures memory usage details
Cleans up temporary device files

Usage Instructions
Clone the repository:
git clone https://github.com/Hariharan822/QA_Projects.git
cd QA_Projects

Make the script executable:
chmod +x health_check.sh

Open the target app on your Android device (must be in the foreground)
Run the script:
./health_check.sh


Sample Report Sections
Performance & A11y Metadata
Graphics Performance (GFXInfo)
UI Hierarchy & Node Count
Unlabeled Clickable Elements (Accessibility Violation)
Memory Usage Snapshot

Use Cases
Accessibility smoke testing
Performance sanity checks
Exploratory testing support
Pre-release quality validation
UI complexity analysis
Debugging memory and rendering issues

Limitations
Target application must be actively visible
Accessibility checks are heuristic-based and not a full WCAG audit
CSV report contains multiline data (best viewed in a text editor)

Future Enhancements
HTML and JSON report formats
Structured accessibility violation summaries
Threshold-based pass/fail indicators
CI/CD pipeline integration
Support for targeting background applications

Author
Hariharan Sukumaran
Senior QA Engineer | SDET
GitHub: https://github.com/Hariharan822

License
This project is licensed under the MIT License.
You are free to use, modify, and distribute this tool with attribution.

