$currentBranch = git rev-parse --abbrev-ref HEAD 2>$null

$stagedFiles = git diff --cached --name-only 2>$null
$pubspecChanged = $stagedFiles | Where-Object { $_ -eq "pubspec.yaml" }

$versionChanged = $false
if ($pubspecChanged) {
    $oldVersion = git show HEAD:pubspec.yaml 2>$null | Select-String "^version:" | ForEach-Object { ($_ -split ":")[1].Trim() }
    $newVersion = Get-Content "pubspec.yaml" | Select-String "^version:" | ForEach-Object { ($_ -split ":")[1].Trim() }

    if ($oldVersion -ne $newVersion) {
        $versionChanged = $true
        Write-Host "Version change detected: $oldVersion -> $newVersion" -ForegroundColor Yellow
    }
}

$commitMessage = $env:GIT_COMMIT_MESSAGE
if (-not $commitMessage) {
    $commitMessage = $args[0]
}

$isVersionCommit = $false
if ($commitMessage -match "^v\d+\.\d+\.\d+" -or $versionChanged) {
    $isVersionCommit = $true
}

Write-Host "Performing standard checks..." -ForegroundColor Blue

if (Get-Command dart -ErrorAction SilentlyContinue) {
    Write-Host "Checking formatting (dart format)..." -ForegroundColor Cyan
    dart format --output=none --set-exit-if-changed .
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Code formatting error" -ForegroundColor Red
        exit 1
    }

    Write-Host "Static analysis (flutter analyze)..." -ForegroundColor Cyan
    if (Get-Command flutter -ErrorAction SilentlyContinue) {
        flutter analyze
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Static analysis errors" -ForegroundColor Red
            exit 1
        }
    } else {
        dart analyze
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Static analysis errors" -ForegroundColor Red
            exit 1
        }
    }
} else {
    Write-Host "Dart/Flutter not found. Skipping checks." -ForegroundColor Yellow
}

if ($isVersionCommit) {
    Write-Host ""
    Write-Host "Version commit detected. Starting automatic build..." -ForegroundColor Green
    Write-Host "This may take several minutes..." -ForegroundColor Yellow

    $buildScript = Join-Path $PSScriptRoot "build_release.ps1"
    if (Test-Path $buildScript) {
        try {
            & $buildScript
            if ($LASTEXITCODE -eq 0) {
                Write-Host "Release build completed successfully!" -ForegroundColor Green
                Write-Host "Files saved in releases/ folder" -ForegroundColor Cyan
            } else {
                Write-Host "Error during release build" -ForegroundColor Red
                Write-Host "Commit will continue, but build failed" -ForegroundColor Yellow
            }
        } catch {
            Write-Host "Error running build: $_" -ForegroundColor Red
            Write-Host "Commit will continue, but build failed" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Build script not found: $buildScript" -ForegroundColor Yellow
    }
} else {
    Write-Host "Regular commit - no build required" -ForegroundColor Cyan
}

Write-Host "Pre-commit completed successfully" -ForegroundColor Green
exit 0
