# Downtime testing script

´´´
while (1) {try {Write-Host (Get-Date).ToString('MM/dd/yyyy hh:mm:ss') ":" (ConvertFrom-Json (Invoke-WebRequest -Uri pizza-selector-be-dev.azurewebsites.net/actuator/health/custom -TimeoutSec 10)).components.random.details.hostname} catch {Write-Host (Get-Date).ToString('MM/dd/yyyy hh:mm:ss') ":" $_.Exception }; sleep 1}
´´´
