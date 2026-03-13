#
# Nastavi Planet API ključ kot uporabniško okoljsko spremenljivko
#
# Uporaba: .\set_planet_api_key.ps1
#
# apiKey - Planet API ključ, zapisan v tej skripti
# Preveri, ali je PL_API_KEY ze nastavljen, in vpraša za prepis
#
# Krištof Oštir
# 2026-03-13
# 1.0

$apiKey = "PRILEPITE_SVOJ_PLANET_API_KLJUC_TUKAJ"

if ([string]::IsNullOrWhiteSpace($apiKey) -or $apiKey -eq "PRILEPITE_SVOJ_PLANET_API_KLJUC_TUKAJ") {
	Write-Warning "Vnesite svoj Planet API ključ v spremenljivko `$apiKey."
	exit 0
}

$existingKey = [System.Environment]::GetEnvironmentVariable("PL_API_KEY", "User")
if (-not [string]::IsNullOrWhiteSpace($existingKey)) {
	Write-Host "PL_API_KEY je ze nastavljen za uporabnika: $env:USERNAME"
	$answer = Read-Host "Ali želite prepisati obstoječo vrednost? (d/n)"
	if ($answer -notin @("da", "d", "yes", "y")) {
		Write-Host "Sprememba je bila preklicana."
		exit 0
	}
}

[System.Environment]::SetEnvironmentVariable("PL_API_KEY", $apiKey, "User")

Write-Host "Spremenljivka PL_API_KEY je nastavljena za uporabnika: $env:USERNAME"
Write-Host "Zaprite in znova odprite terminal ali VS Code, da se sprememba osveži v novih sejah."
