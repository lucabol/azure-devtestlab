[CmdletBinding()]
param(
    [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]
    $CsvConfigFile,

    [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = "If a lab contains any of these tags, it will be selected")]
    [ValidateNotNullOrEmpty()]
    [string]
    $AnId
    )

Import-Module ../../Az.LabServices.psm1 -Force
Import-Module ../LabCreationLibrary.psm1 -Force

$CsvConfigFile `
  | Import-LabsCsv `
  | Select-Lab -Id $AnId `
  | Set-LabProperty -ResourceGroup Staging -MaxUsers 50 `
  | Publish-Labs