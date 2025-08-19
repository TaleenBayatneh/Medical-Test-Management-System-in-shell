# Medical Test Management System

A Bash shell script for managing patient medical test records from the command line.

## Features

*   **Add Records:** Insert new test results with full input validation.
*   **Search Records:** Find tests by Patient ID. Filter by status, date, or abnormal results.
*   **Find Abnormal Tests:** Lists all tests that fall outside the normal range.
*   **Calculate Averages:** Shows the average result for each type of test.
*   **Update/Delete:** Edit existing results or remove records completely.

## How to Use

1.  Save the script as `medical_system.sh`.
2.  Make it executable:
    ```bash
    chmod +x medical_system.sh
    ```
3.  Run the program:
    ```bash
    ./medical_system.sh
    ```

## Data Files

The system uses two text files:
*   `medicalRecord.txt`: Stores all patient data (created automatically).
*   `medicalTest.txt`: Stores the names and normal ranges for each test (created automatically).

## Supported Tests

*   Hemoglobin (Hgb)
*   Blood Glucose Test (BGT)
*   LDL Cholesterol
*   Systolic Blood Pressure (systole)
*   Diastolic Blood Pressure (diastole)
