 Remove-Variable -ErrorAction SilentlyContinue -WarningAction SilentlyContinue *
 
 $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

 $goalie = (Get-Clipboard).split("	")
 $rank0 = $goalie[0]
 $name = $goalie[0]
 $team = $goalie[0]
 $rank0 = $goalie[12]



$body = [ordered]@{
    f0 = $rank0
    f1 = $name
}
$json = $body | ConvertTo-Json -Compress
$json = $json.Replace('"','\"').replace('`n','')
$json
$command = "CG 1-21 ADD 1 ""NiceGameInfo/Goaliestat/GOALIE"" 1 ""$json"""


# CG 1-20 ADD 1 "iceGameInfo/ltblue/LOWER THIRD" 1 "{\"f0\":\"test\",\"f1\":\"value2\",\"f2\":\"value3\"}"\r\n


add-type -path "$ScriptDir\CasparCGNETConnector.dll"
$casparcg = new-object "CasparCGNETConnector.CasparCGConnection"
$casparcg.connect("$env:COMPUTERNAME",5250)
$casparcg.sendCommand($command)
sleep(5)
$casparcg.sendCommand('CG 1-21 STOP 1')
$casparcg.close()

