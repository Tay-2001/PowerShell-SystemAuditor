<#
.SYNOPSIS
  Gathers system info and exports to CSV.
#>

param(
  [switch]$IncludeProcesses,
  [string]$OutputDirectory = (Get-Location)
)

function Get-SystemInfo {
  [PSCustomObject]@{
    Timestamp    = (Get-Date)
    ComputerName = $env:COMPUTERNAME
    CPU          = (Get-CimInstance Win32_Processor).Name
    MemoryGB     = [math]::Round((Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize / 1MB, 2)
    DiskFreeGB   = [math]::Round((Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object FreeSpace -Sum).Sum /1GB,2)
  }
}

# Main
$report = Get-SystemInfo

# Ensure output directory exists
if (-not (Test-Path $OutputDirectory)) {
  New-Item -ItemType Directory -Path $OutputDirectory | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$outFile   = Join-Path $OutputDirectory "audit-report-$timestamp.csv"

$report | Export-Csv -Path $outFile -NoTypeInformation
Write-Host "Report saved to $outFile"
