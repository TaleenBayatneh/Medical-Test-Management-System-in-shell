# Medical Test Management System (Bash)

A **Bash shell script** for managing patient medical test records directly from the command line.  
The system provides an interactive menu to add, search, update, and analyze medical test data, with full validation and error handling.

---

##  Features

- **Add Records**: Insert new patient test results with strict validation for:
  - Patient ID (7-digit number only)
  - Test name (must match predefined catalog)
  - Date format (YYYY-MM)
  - Result values (numeric only)
  - Units (must match the selected test type)
  - Status (*pending* or *completed*)
- **Search Records**:
  - Find tests by Patient ID
  - Filter by **status**, **date range**, or **abnormal results**
- **Abnormal Test Detection**: Identify tests outside the normal clinical range.
- **Calculate Averages**: Compute the average result for each supported test type.
- **Update & Delete**: Edit existing results or remove records completely.
- **User-Friendly Menu**: Simple interactive CLI with input validation.

---

##  Supported Tests

The following medical tests are pre-configured with normal ranges and units:

| Test Name | Normal Range | Unit |
|-----------|--------------|------|
| Hemoglobin (Hgb) | 13.8 – 17.2 | g/dL |
| Blood Glucose Test (BGT) | 70 – 99 | mg/dL |
| LDL Cholesterol (LDL) | < 100 | mg/dL |
| Systolic Blood Pressure (systole) | < 120 | mm Hg |
| Diastolic Blood Pressure (diastole) | < 80 | mm Hg |

---

##  Data Files

The system stores data in two text files (created automatically if missing):

- **`medicalTest.txt`** → Stores predefined medical test definitions with ranges and units.  
- **`medicalRecord.txt`** → Stores patient test records in plain text format.  

Example record in `medicalRecord.txt`:
```

1234567: Hgb, 2024-03, 14.50, g/dL, completed

````

---

##  Menu Options

When executed, the program displays an interactive menu:

```
Welcome to our Medical Test Management System
1- Add new medical test record
2- Search for a test by patient ID
3- Search for abnormal tests
4- Average test values
5- Update an existing test result
6- Delete an existing test record
7- Exit
```

---

##  Example Run

```
Enter one of these options: 1
please enter patient ID:
1234567
please enter test name:
Hgb
please enter test date in this form (YYYY-MM):
2024-03
please enter test result:
14.5
please enter test unit:
g/dL
please enter the status:
completed

This new test record has been added successfully
```

---

##  Technical Details

* **Language**: Bash (sh)
* **Dependencies**: Standard Linux/Unix utilities (`grep`, `sed`, `wc`, `cut`, `bc`)
* **Platform**: Works on Linux and macOS terminals
* **Storage**: Plain-text files (no external database required)

---

##  Contributors

* **Taleen Bayatneh (1211305)**
* **Masa Jalamneh (1212145)**

---
