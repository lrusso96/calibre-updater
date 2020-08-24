param(
	[int] $win = 64,
	[switch] $i = $false,
	[switch] $d = $false
)

$author = 'lrusso96'
$name = 'Calibre Updater Tool'
$year = '2020'
$license = 'GPL'
$version = '0.1.0'


function Print-Header(){
	Write-Host "Welcome to " -NoNewLine
	Write-Host "$name " -ForegroundColor Green -NoNewLine
	Write-Host "v$version ($year)."
	Write-Host "This script has been developed by $author and is distributed under $license license."

	Write-Host "`nWindows Version: " -ForegroundColor Yellow -NoNewLine
	Write-Host "$win bit"
	Write-Host 'Skip Download Dialog: ' -ForegroundColor Yellow -NoNewLine
	Write-Host "$d"
	Write-Host 'Skip Installation Dialog: ' -ForegroundColor Yellow -NoNewLine
	Write-Host "$i"
}

Print-Header

If (-Not $d){
	Write-Host "`nWould you like to proceed? (Y/N): " -ForegroundColor Yellow -NoNewline
	$Readhost = Read-Host
	Switch ($ReadHost) {
		N {$shouldDownload=$false}
		Default {$shouldDownload=$true}
	}

	If (-Not $shouldDownload) {
		Write-Host "`nNevermind . See you!"
		exit
	}
}

Clear-Host
Invoke-WebRequest "https://calibre-ebook.com/dist/win$win" -O calibre_installer.msi
Print-Header

If (-Not $i){
	Write-Host "`nWould you like to install Calibre now? (Y/N): " -ForegroundColor Yellow -NoNewline
	$Readhost = Read-Host
	Switch ($ReadHost) {
		N {$shouldInstall=$false}
		Default {$shouldInstall=$true}
	}
}

If ($i -or $shouldInstall) {
	msiexec /i 'calibre_installer.msi'
}
