Clear-Host
$url = "http://docker.data.techcollege.dk:5051"
$StockOverThreshold = Invoke-RestMethod -Method GET -ContentType “application/json” -Uri "$url/StockOverThreshold"
$StockUnderThreshold = Invoke-RestMethod -Method GET -ContentType “application/json” -Uri "$url/StockUnderThreshold"
$WinesInStock = Invoke-RestMethod -Method GET -ContentType “application/json” -Uri "$url/Wines"
Foreach($Wine in $WinesInStock)
{
  $Name = $Wine.WineName
  $Grape = $Wine.BaseGrape
  $MarkUp = $Wine.MarkUp
  $MaxStockThreshold = $Wine.MaxStockThreshold
  $MinStockThreshold = $Wine.MinStockThreshold
  $NumInStock = $Wine.NumInStock
  $PurchasePrice = $Wine.PurchasePrice
  Write-Host "Vin Information:"
  Write-Host "  Navn           - $Name"
  Write-Host "  Base drue      - $Grape"
  Write-Host "  Max på lager   - $MaxStockThreshold"
  Write-Host "  Min på lager   - $MinStockThreshold"
  Write-Host "  Indkøbspris    - $PurchasePrice"
  Write-Host "  Antal på lager - $NumInStock"
}

Write-Host ""
$ClimateControl = Invoke-RestMethod -Method GET -ContentType “application/json” -Uri "$url/ClimateControl"

$CurrHum = $ClimateControl.CurrHum
$MinHum  = $ClimateControl.MinHum  
$MaxHum  = $ClimateControl.MaxHum

$Temp    = $ClimateControl.CurrTemp
$MaxTemp = $ClimateControl.MinTemp
$MinTemp = $ClimateControl.MaxTemp

Write-Host "Minimum temepratur på lager : $MinTemp, maximum temperatur på lager : $MaxTemp"
Write-Host "Minimum relativ luftfugtighed : $MinHum, maximum relativ luftfugtighed : $MaxHum"
Write-Host ""
Write-Host "Aktuelle temperatur             : $Temp"
Write-Host "Aktuelle relative luftfugtighed : $CurrHum"