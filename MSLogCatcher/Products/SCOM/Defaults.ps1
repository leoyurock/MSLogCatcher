$Global:SCOMInstallDirectory = ""
try
{
    $Global:SCOMInstallDirectory = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\12\Setup\Agent").InstallDirectory
    if([string]::IsNullOrEmpty($instDir)) {
        $Global:SCOMInstallDirectory = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\12\Setup\Server").InstallDirectory
    }
} catch [ItemNotFoundException] {
    $Global:SCOMInstallDirectory = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\12\Setup\Server").InstallDirectory
}

$Global:HSCoreProviderGuid = "#417B7AE0-9B8F-4e3f-8FCA-19C706EFF3D4"
$Global:NotificationsGuid = "#947883FC-801B-8F53-FB37-39730F608894"
$Global:AlertSubscriptionGuid = "#455329E9-3C18-BB5B-D9B8-B5EA0DF8FCDC"
$Global:WorkflowProviderGuid = "#c85ab4ed-7f0f-42c7-8421-995da9810fdd"

$Global:Scenario1 = "Communication"
$Global:Scenario2 = "Subscription"
$Global:Scenario3 = "Config/Workflow loading"
$Global:Scenario4 = "Workflow tracing"

$Global:CurrentScenario = ""

$Global:SecondsToSleepForTrace = 900

if($Global:Quiet)
{
    # (default) variables for quite mode
    $Global:CollectLogs = $true
    $Global:CurrentScenario = $Scenario1
    $Global:WorkflowNameToTrace = "Microsoft.Exchange.2010.ClientAccessRole.DiscoveryRule"
}
