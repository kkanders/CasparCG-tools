Remove-Variable *
cd "C:\Users\amol\Downloads\CasparCG.Server-2.1.8NRK\CasparCG Server\server\template\NiceGameInfo\Goaliestat\playerliste"
$split = "	"
$golie = Import-Csv .\hgoalie.csv -Header nr,player -Delimiter $split

$table,$goalie,$homefinalcut,$line = ""

foreach ($line in $golie) {
#$line.nr
#$table += "<tr>`r`n"

$table += "<tr>`r`n"
    $table += "<td class='nr'>$($line.nr)</td>"
    $table += "<td class='player'>$($line.player)</td>"    
    $table += "<tr>`r`n"

 }




$homefinalcut += $goalie
$homefinalcut += $table

$homefile = Get-Content ..\rooster.html
$homefile = $homefile.Replace('#change#',$homefinalcut)
$homefile | Out-File ..\homerooster.html -Force 






#$table