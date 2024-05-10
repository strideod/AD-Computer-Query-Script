# Define the path for the CSV file used to grabe computer names
$username = $Env:USERNAME
$csvPath = "C:\Users\$username\Downloads\computers.csv"
$outputFile = "C:\Users\$username\Downloads\output.txt"

# Import the computer names from the CSV file and convert them to a hashtable
$computerHashTable = @{}
try {
	$importedComputers = Import-Csv -Path $csvPath
	foreach ($computer in $importedComputers) {
		$computerHashTable[$computer.Name] = $true
	}
} catch {
	Write-Output "CSV did not load properly" | Out-File -Append -FilePath $outputFile
}

# Iterate through each computer name in the hashtable
foreach ($name in $computerHashTable.Keys) {
	try {
		# Here we only retrieve the AD computer object without specifying properties as the earlier properties are not required
		$adComputer = Get-ADComputer -Identity $name -Properties lastlogondate,location -ErrorAction Stop
		$adComputer | Select-Object Name, LastLogonDate, Location | Out-String -Width 1000 | Out-File -Append -FilePath  $outputFile
	} catch {
		Write-Output "Computer $name not found or an error occurred." | Out-File -Append -FilePath $outputFile
	}
}
