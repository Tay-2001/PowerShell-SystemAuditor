# PowerShell System Auditor

**Dates:** Jul 2023 – Sep 2023  
**Description:** A CLI PowerShell tool that gathers Windows system information (CPU, memory, disk, network) and exports a CSV report for audits and troubleshooting.

---

## 🖥️ Features

- Collects:
  - CPU model & usage  
  - Total & available RAM  
  - Disk space per volume  
  - Network adapter configurations  
- Outputs a timestamped `audit-report-<YYYYMMDD_HHMMSS>.csv`  
- Colorized console output for quick viewing  
- Supports optional parameters:
  - `-IncludeProcesses` to list top CPU-consuming processes  
  - `-OutputDirectory <path>` to save reports elsewhere

---

## 🚀 Getting Started

1. **Clone the repo**  
   ```powershell
   git clone https://github.com/Tay-2001/PowerShell-SystemAuditor.git
   cd PowerShell-SystemAuditor

# Simple audit
.\src\SystemAuditor.ps1

# With extra options
.\src\SystemAuditor.ps1 -IncludeProcesses -OutputDirectory "C:\Reports"
