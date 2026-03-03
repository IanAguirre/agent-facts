param(
  [string]$BaseUrl = "https://agent-facts.com"
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

function Get-Status($url) {
  try {
    $r = Invoke-WebRequest -Uri $url -Method Head -MaximumRedirection 5 -UseBasicParsing
    [pscustomobject]@{
      Url = $url
      Status = [int]$r.StatusCode
      Type = $r.Headers["Content-Type"]
      Length = $r.Headers["Content-Length"]
      Ok = $true
    }
  } catch {
    [pscustomobject]@{
      Url = $url
      Status = 0
      Type = ""
      Length = ""
      Ok = $false
      Error = $_.Exception.Message
    }
  }
}

$targets = @(
  "$BaseUrl/",
  "$BaseUrl/agent-facts.html",
  "$BaseUrl/llms.txt",
  "$BaseUrl/robots.txt",
  "$BaseUrl/agent-facts-protocol-v2.1.pdf"
)

"Agent-Facts Protocol health check: $(Get-Date -Format s)"
$results = $targets | ForEach-Object { Get-Status $_ }
$results | Format-Table -AutoSize

$failed = $results | Where-Object { -not $_.Ok -or $_.Status -lt 200 -or $_.Status -ge 400 }
if ($failed.Count -gt 0) {
  Write-Error "One or more critical links failed."
}

