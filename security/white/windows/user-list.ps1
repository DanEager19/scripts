foreach ($line in Get-Content .\users.txt) {
    if ($line -match '^(.+)\*$') {
        New-LocalUser -Name $line.Substring(0, $line.Length - 1) -Password "Password1!"
    } else {
        New-LocalUser -Name $line -Password "Password1!"
    }
}