# PS-Trigger-IFTTT

Small PowerShell module to trigger the  [IFTTT Maker Channel][1]

## Installation

Installing the module is best done via the [PowerShell Gallery][2] by running the following command

```powershell
Install-Module -Name PSTriggerIfttt
```

## Usage

```powershell
Send-IftttMakerEvent -EventName 'DeepThought' -SecretKey 'Keykerikey' -Value1 'UltimateQuestion' -Value2 '42'
```

[1]: https://ifttt.com/maker
[2]: https://www.powershellgallery.com/packages/PSTriggerIfttt
