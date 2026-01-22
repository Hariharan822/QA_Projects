---

# **Android Package Version Audit CLI**

A lightweight **ADB-based Bash CLI utility** to extract **accurate package version details** for a specified Android system or application package, along with essential **device metadata**.

This script is particularly useful for validating **Google Play Services (`com.google.android.gms`) versions** across devices during testing, troubleshooting, or compliance checks.

---

## **Purpose**

Android devices may contain **multiple historical or rollback versions** of a package. This tool ensures that **only the currently active (latest) version** is reported by extracting the **first occurrence** of version information from `dumpsys package`.

---

## **Default Target Package**

`com.google.android.gms`

You can modify the script to audit any other package by updating:

`TARGET_PKG="your.package.name"`

---

## **Key Features**

### **Device Information**

* Manufacturer  
* Model  
* Device name  
* Serial number  
* Android version  
* Build number

### **Package Audit**

* Package presence verification  
* Active `versionCode`  
* Active `versionName`  
* Avoids reporting older rollback versions

### **Clean Execution**

* Temporary files are created on-device and removed automatically  
* Output is formatted for easy reading in the terminal

---

## **Sample Output Sections**

* Device Information  
* Package Details  
* Version Code  
* Version Name  
* Package Status (Installed / Not Found)

---

## **Prerequisites**

Ensure the following are available:

* macOS / Linux / Windows (Git Bash or WSL)  
* Android SDK with **ADB** configured in system PATH  
* At least one Android device connected via USB  
* USB debugging enabled on the device

Verify connection:

`adb devices`

---

## **How It Works**

1. Detects a connected Android device  
2. Collects device metadata using `getprop`  
3. Dumps package details using `dumpsys package`  
4. Extracts the **latest versionCode and versionName**  
5. Cleans up temporary files  
6. Prints a structured audit report

---

## **Usage Instructions**

1. Clone the repository:

`git clone https://github.com/Hariharan822/QA_Projects.git`

`cd QA_Projects`

2. Make the script executable:

`chmod +x Package_Details.sh`

3. Connect an Android device and unlock it  
4. Run the script:

`./Package_Details.sh`

---

## **Use Cases**

* Verifying Google Play Services versions across test devices  
* Pre-release environment validation  
* Debugging Play Services–dependent crashes  
* Device certification and compliance checks  
* QA regression and sanity testing

---

## **Limitations**

* Requires USB debugging  
* Some OEMs may restrict `dumpsys` access  
* Package presence does not guarantee functional integrity

---

## **Author**

**Hariharan Sukumaran**  
Senior QA Engineer | SDET  
GitHub: [https://github.com/Hariharan822](https://github.com/Hariharan822)

---

## **License**

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this script with attribution.