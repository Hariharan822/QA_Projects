---

# **Android Screen Recording & Bugreport Automation CLI**

A simple yet powerful **ADB-based Bash CLI utility** that automates the process of **screen recording an issue and capturing a corresponding bugreport** for Android devices.

This tool is designed for **QA Engineers, SDETs, Support Engineers, and Android Developers** who need reproducible evidence (video \+ bugreport) when reporting defects or investigating production issues.

---

## **What This Script Does**

This script guides you through a **manual reproduction flow** while automating all technical steps:

1. Starts an Android screen recording  
2. Waits while you reproduce the issue  
3. Stops recording on demand  
4. Generates a **full Android bugreport**  
5. Pulls the recorded video to your machine  
6. Cleans up temporary files on the device

Both artifacts are timestamped and aligned to the **same reproduction window**.

---

## **Generated Artifacts**

After execution, the following files are created in the current directory:

* `Recording_<timestamp>.mp4` – Screen recording of the issue  
* `Bugreport_<timestamp>.zip` – Full Android bugreport

These files can be directly attached to:

* Jira tickets  
* Bug tracking systems  
* OEM escalation emails  
* Internal investigation reports

---

## **Prerequisites**

Ensure the following are available:

* macOS / Linux / Windows (Git Bash or WSL)  
* Android SDK with **ADB** available in PATH  
* At least one Android device connected via USB  
* USB debugging enabled on the device  
* Sufficient free storage on the device

Verify connection:

`adb devices`

---

## **How the Script Works**

1. Generates timestamp-based filenames  
2. Starts `screenrecord` in the background on the device  
3. Waits for user input to stop recording  
4. Gracefully terminates `screenrecord` to finalize the MP4 file  
5. Triggers `adb bugreport` and saves it locally  
6. Pulls the recorded video from the device  
7. Deletes temporary device files

---

## **Usage Instructions**

1. Clone the repository:

`git clone https://github.com/Hariharan822/QA_Projects.git`

`cd QA_Projects`

2. Make the script executable:

`chmod +x record_and_bugreport.sh`

3. Connect and unlock your Android device  
4. Run the script:

`./record_and_bugreport.sh`

5. Follow on-screen prompts:  
   * Press **ENTER** to start recording  
   * Reproduce the issue on the device  
   * Press **ENTER** again to stop recording and generate bugreport

---

## **Ideal Use Cases**

* Capturing intermittent or hard-to-reproduce issues  
* Regression defect reporting  
* OEM or vendor escalations  
* Performance or ANR investigations  
* Production issue triage  
* Support and diagnostics workflows

---

## **Notes & Best Practices**

* Keep the reproduction concise to reduce bugreport size  
* Avoid locking the device during recording  
* Bugreport generation may take several minutes depending on device state  
* Ensure sufficient battery level or keep the device charging

---

## **Limitations**

* Requires USB debugging  
* Screen recording stops if the device reboots  
* Some OEMs may restrict `pkill` behavior  
* Bugreport size can be large (hundreds of MB)

---

## **Author**

**Hariharan Sukumaran**  
Senior QA Engineer | SDET  
GitHub: [https://github.com/Hariharan822](https://github.com/Hariharan822)

---

## **License**

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this script with attribution.

