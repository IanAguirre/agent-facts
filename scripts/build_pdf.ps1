# build_pdf.ps1 - generate a PDF of the v2.2 HTML spec using wkhtmltopdf if available
param(
    [string]$SourceHtml = "agent-facts-protocol-v2.2.html",
    [string]$OutputPdf = "agent-facts-protocol-v2.2.pdf"
)

$wk = Get-Command wkhtmltopdf -ErrorAction SilentlyContinue
if (-not $wk) {
    Write-Output "wkhtmltopdf not found. Install from https://wkhtmltopdf.org/ or use Chrome/Edge headless to render."
    Write-Output "Example (wkhtmltopdf): wkhtmltopdf $SourceHtml $OutputPdf"
    exit 1
}

$in = Join-Path -Path (Get-Location) -ChildPath $SourceHtml
$out = Join-Path -Path (Get-Location) -ChildPath $OutputPdf
Write-Output "Running: wkhtmltopdf $in $out"
& wkhtmltopdf $in $out
if ($LASTEXITCODE -eq 0) { Write-Output "PDF generated: $out" } else { Write-Output "wkhtmltopdf failed with exit code $LASTEXITCODE"; exit $LASTEXITCODE }
