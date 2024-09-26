param(
    [string]$ReportPath,
    [string]$ReportServerUri = "http://192.168.1.5/Reports",
    [string]$DestinationFolder = "/powerbifiles",
    [string]$Username="Dwarkesh\Naumaan",
    [string]$Password="Dwarkesh",
    [bool]$Overwrite = $true
)

# Load the required module
Import-Module ReportingServicesTools

# Create a PSCredential object

$Credential = New-Object System.Management.Automation.PSCredential($Username, $Password)

# Publish the report
Publish-RsReport -ReportServerUri $ReportServerUri -ReportPath $ReportPath -DestinationFolder $DestinationFolder -Credential $Credential -Overwrite $Overwrite

if ($?) {
    Write-Host "Report deployed successfully."
} else {
    Write-Error "Failed to deploy the report."
}
