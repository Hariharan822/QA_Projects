# **Android Comprehensive Device Audit CLI**

A lightweight **ADB-based Bash CLI tool** that performs a **comprehensive Android device audit**, covering **device identity, OS details, network status, hardware health, and security risk indicators**.

This utility is ideal for **QA Engineers, SDETs, Mobile Security Testers, and Support Engineers** who need instant visibility into a connected Android device without installing third-party tools.

---

## **Key Capabilities**

### **Device Identification**

* Manufacturer  
* Model  
* Serial number  
* CPU architecture

### **Software & System**

* Android version and API level  
* Security patch level  
* Device uptime

### **Network & Connectivity**

* Wi-Fi IP address  
* MAC address  
* Wi-Fi connection status

### **Hardware Health**

* Battery level  
* Battery temperature  
* Screen resolution

### **Security Risk Assessment**

* SELinux enforcement status  
* Root detection (heuristic)  
* Bootloader lock status  
* Build tags (official vs custom)  
* Debuggable build flag  
* Unknown sources installation setting

---

## **Output**

The script prints a **human-readable audit report** directly to the terminal, structured into clearly separated sections:

* Identification  
* Software & System  
* Network Status  
* Hardware Vitals  
* Security Risk Assessment

Example use cases:

* Pre-testing device validation  
* Security posture checks  
* Production issue triage  
* Device health verification  
* Support and diagnostics workflows

---

## **Prerequisites**

Ensure the following are available:

* macOS / Linux / Windows (Git Bash or WSL)  
* Android SDK with **ADB** configured in PATH  
* At least one Android device connected via USB  
* USB debugging enabled on the device

Verify device connection:

`adb devices`

---

## **How the Script Works**

1. Detects a connected Android device  
2. Collects system properties using `getprop`  
3. Queries network and hardware state via `dumpsys`  
4. Evaluates security-relevant system flags  
5. Outputs a consolidated audit report to the console

---

## **Usage Instructions**

1. Clone the repository:

`git clone https://github.com/Hariharan822/QA_Projects.git`

`cd QA_Projects`

2. Make the script executable:

`chmod +x Security_Audit.sh`

3. Connect an Android device via USB and unlock it  
4. Run the script:

`./Security_Audit.sh`

---

## **Security Notes**

* Root detection is **heuristic-based** and not a definitive guarantee  
* Bootloader and debuggable checks are based on system properties  
* Results should be interpreted as **indicators**, not formal certifications

---

## **Limitations**

* Requires USB debugging to be enabled  
* Wi-Fi information is unavailable if Wi-Fi is disabled  
* Some OEMs may restrict access to certain system properties

---

## **Ideal Use Cases**

* QA device readiness checks  
* Security smoke testing  
* Regression test environment validation  
* Support diagnostics  
* Mobile device compliance verification

---

## **Author**

**Hariharan Sukumaran**  
Senior QA Engineer | SDET  
GitHub: [https://github.com/Hariharan822](https://github.com/Hariharan822)

---

## **License**

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this script with attribution.