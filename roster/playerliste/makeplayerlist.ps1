Remove-Variable *
cd "C:\Users\amol\Downloads\CasparCG.Server-2.1.8NRK\CasparCG Server\server\template\NiceGameInfo\roster\playerliste"
$split = "	"
$hjemme = Import-Csv .\hjemme.csv -Header nr,player -Delimiter $split
$gjester = Import-Csv .\gjester.csv -Header nr,player  -Delimiter $split
$table,$goalie,$homefinalcut,$line = ""

foreach ($line in $hjemme) {
#$line.nr
#$table += "<tr>`r`n"

if($line.player -like "*(G)" ) {
$goalie += "<tr>`r`n"
$goalie += "<td class='nr'>$($line.nr)</td>"
$goalie += "<td class='player_goalie'>$($line.player)</td>"
$goalie += "</tr>`r`n"
} else {
$table += "<tr>`r`n"
    $table += "<td class='nr'>$($line.nr)</td>"
    $table += "<td class='player'>$($line.player)</td>"    
    $table += "<tr>`r`n"
    }



} 



$homefinalcut += $goalie
$homefinalcut += $table

$homefile = Get-Content ..\rooster.html
$homefile = $homefile.Replace('#change#',$homefinalcut)
$homefile | Out-File ..\homerooster.html -Force 

$table,$goalie,$homefinalcut,$line = ""

foreach ($line in $gjester) {
#$line.nr
#$gtable += "<tr>`r`n"

if($line.player -like "*(G)" ) {
$ggoalie += "<tr>`r`n"
$ggoalie += "<td class='nr'>$($line.nr)</td>"
$ggoalie += "<td class='player_goalie'>$($line.player)</td>"
$ggoalie += "</tr>`r`n"
} else {
    $gtable += "<tr>`r`n"
    $gtable += "<td class='nr'>$($line.nr)</td>"
    $gtable += "<td class='player'>$($line.player)</td>"    
    $gtable += "<tr>`r`n"
    }



} 

$gjestfinalcut += $ggoalie
$gjestfinalcut += $gtable

$guestfile = Get-Content ..\rooster.html
$guestfile = $guestfile.Replace('#change#',$gjestfinalcut)
$guestfile | Out-File ..\gjestrooster.html -Force 






#$table