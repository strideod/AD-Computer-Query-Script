# AD Computer Query Script

## Description
This PowerShell script imports a list of computer names from a CSV file, queries Active Directory (AD) for each computer, and writes specific properties (name, last logon date, and location) to a text file. It is designed to help system administrators quickly gather and record information about multiple computers registered in AD.

## Features
- **CSV Input:** Reads computer names from a CSV file.
- **AD Lookup:** Retrieves detailed information about each computer from Active Directory.
- **Error Handling:** Gracefully handles and logs errors such as missing computers or access issues.
- **Output to File:** Appends results to a text file, making it easy to archive or review.

## Prerequisites
- PowerShell 5.1 or higher.
- Active Directory module for PowerShell.
- Read access to the Active Directory from the machine where the script is run.
- Write permissions to the destination paths for the CSV and output text files.

## Usage
1. **Prepare your CSV file** with a header and list of computer names under the header `Name`:
    ```
    Name
    Computer1
    Computer2
    Computer3
    ```

2. **Set file paths** in the script:
    ```powershell
    $csvPath = "C:\Users\$Env:USERNAME\Downloads\computers.csv"
    $outputFile = "C:\Users\$Env:USERNAME\Downloads\output.txt"
    ```

3. **Run the script**:
    - Open PowerShell.
    - Navigate to the directory containing the script.
    - Execute the script:
      ```powershell
      .\ADQueryScript.ps1
      ```

## Configuration Options
- Modify `$csvPath` and `$outputFile` in the script to change the locations of the input and output files.

## Error Handling
The script includes error handling for:
- Missing CSV files.
- Non-existent computers in AD.
- Permission issues during file writing.
Errors are logged to both the console and the output text file.

## Output
Results are appended to the specified output file and include:
- Computer name.
- Last logon date.
- Location.

Each entry is formatted to be human-readable and is separated by a specific delimiter for clarity.

## Troubleshooting
- **CSV File Not Loading:** Ensure the CSV file exists at the specified path and is not locked by another process.
- **AD Query Failures:** Verify that the computer names in the CSV are correct and exist in AD.
- **Permission Errors:** Check that your user account has the necessary permissions to read from AD and write to the output locations.

## Contributing
Feel free to fork the repository and submit pull requests with enhancements. Please open issues for any bugs found or features requested.
