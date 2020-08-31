# calibre-updater

A simple PowerShell script to download and install Calibre on Windows.

## About

This script downloads the latest Calibre version (Win 32/64) from the official website.
Then it starts the installation process, which needs to be manually completed by the user (for settings, custom installation, etc.).

## How to run

```
> & "calibre-updater.ps1" [-d] [-i] [-win (32|64)]
```

### Flags

- **i**: skips the Installation dialog.
- **d**: skips the Download dialog.

### Parameters

- **win**: 32/64. Specifies the version to install.

**Note:** for sake of simplicity, I have included in the release assets an executable version that you can download and run.
