Set-StrictMode -Version Latest
<#
    .SYNOPSIS
        Triggers an event on the IFTTT Maker Channel.
    .DESCRIPTION
        Send-IftttMakerEvent triggers an event on the IFTTT Maker Channel.
        The particular event and 3 values can be specified when triggering.
    .PARAMETER EventName
        The name of the event to trigger on the IFTTT Maker Channel.
    .PARAMETER SecretKey
        The secret key you got from IFTTT for triggering events on the Maker Channel.
    .PARAMETER Value1
        First value of the triggered event (ingredient Value1).
    .PARAMETER Value2
        Second value of the triggered event (ingredient Value2).
    .PARAMETER Value3
        Third value of the triggered event (ingredient Value3).
#>
function Send-IftttMakerEvent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$EventName,

        [Parameter(Mandatory=$true)]
        [string]$SecretKey,

        [string]$Value1,

        [string]$Value2,

        [string]$Value3
    )

    $uri = 'https://maker.ifttt.com/trigger/{0}/with/key/{1}' -f $EventName, $SecretKey

    $body = @{}
    if ($Value1) {
        $body.value1 = $Value1
    }
    if ($Value2) {
        $body.value2 = $Value2
    }
    if ($Value3) {
        $body.value3 = $Value3
    }
    $bodyJson = ConvertTo-Json $body

    $arguments = @{
        Uri = $uri
        Method = 'Post'
        ContentType = 'application/json'
        Body = $bodyJson
    }
    Invoke-RestMethod @arguments
}