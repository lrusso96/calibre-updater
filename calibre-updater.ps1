$author = 'lrusso96'
$name = 'Calibre Updater Tool'
$year = '2020'
$license = 'GPL'
$version = '0.1.0'


Write-Host "Welcome to $name v.v$version ($year)."
Write-Host "This script has been developed by $author and is distributed under $license license."

Write-Host '`nWould you like to proceed? (Y/N): ' -ForegroundColor Yellow -NoNewline
$Readhost = Read-Host
Switch ($ReadHost) {
	N {$shouldDownload=$false}
	Default {$shouldDownload=$true}
}

If (-Not $shouldDownload) {
	Read-Host 'Nevermind. See you! (press enter to exit)'
	exit
}

Invoke-WebRequest https://calibre-ebook.com/dist/win64 -O calibre_installer.msi
Write-Host '`nWould you like to install Calibre now? (Y/N): ' -ForegroundColor Yellow -NoNewline
$Readhost = Read-Host
Switch ($ReadHost) {
	N {$shouldInstall=$false}
	Default {$shouldInstall=$true}
}

If ($shouldInstall) {
	msiexec /i 'calibre_installer.msi'
}
