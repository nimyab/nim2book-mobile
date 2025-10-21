param([string]$Version = "")

function Get-AppVersion {
    if ($Version -ne "") { return $Version }
    if (Test-Path "pubspec.yaml") {
        $content = Get-Content "pubspec.yaml"
        $versionLine = $content | Where-Object { $_ -match "^version:" }
        if ($versionLine) {
            return ($versionLine -split ":")[1].Trim()
        }
    }
    return "1.0.0+1"
}

Write-Host "Flutter Release Builder" -ForegroundColor Blue
Write-Host "======================" -ForegroundColor Blue

try {
    flutter --version | Out-Null
    Write-Host "Flutter OK" -ForegroundColor Green
} catch {
    Write-Host "Flutter not found" -ForegroundColor Red
    exit 1
}

if (!(Test-Path ".env")) {
    if (Test-Path ".env.example") {
        Copy-Item ".env.example" ".env"
        Write-Host ".env created from example" -ForegroundColor Yellow
    } else {
        Write-Host ".env file missing" -ForegroundColor Red
        exit 1
    }
}

$releaseDir = "releases"
if (!(Test-Path $releaseDir)) {
    New-Item -ItemType Directory -Path $releaseDir | Out-Null
}

Write-Host "Getting dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "Skipping tests for now..." -ForegroundColor Yellow

Write-Host "Building APK..." -ForegroundColor Yellow
flutter build apk --release
if ($LASTEXITCODE -ne 0) { exit 1 }

$appVersion = Get-AppVersion
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

$apkSource = "build\app\outputs\flutter-apk\app-release.apk"

if (Test-Path $apkSource) {
    $apkDest = "$releaseDir\nim2book_v${appVersion}_${timestamp}.apk"
    Copy-Item $apkSource $apkDest
    Write-Host "APK copied: $apkDest" -ForegroundColor Green
}

Write-Host "Build completed successfully!" -ForegroundColor Green
