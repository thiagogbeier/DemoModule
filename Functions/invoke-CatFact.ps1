Param (
    [switch] $Male,
    [switch] $Female,
    $Text = "Please input a text in double quotes"
)

#$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
#[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols
if ($Female)
{ $voice = 1 }
else
{ $voice = 0 }
#Add-Type -AssemblyName System.Speech;
$Speak = New-Object -ComObject SAPI.SPVoice
$Speak.Voice = $Speak.GetVoices().Item($voice)
$Speak.Speak($(irm 'https://catfact.ninja/fact' -UseBasicParsing).fact) | Out-Null