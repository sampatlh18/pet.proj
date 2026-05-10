# Build PetHubProject.war. Uses Maven from PATH, or downloads a portable Maven once into .maven/
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

function Get-MavenBin {
    $mvnCmd = Get-Command mvn -ErrorAction SilentlyContinue
    if ($mvnCmd) { return $mvnCmd.Source }

    $root = Join-Path $PSScriptRoot ".maven"
    $mvnHome = Join-Path $root "apache-maven-3.9.9"
    $mvnBat = Join-Path $mvnHome "bin\mvn.cmd"
    if (-not (Test-Path $mvnBat)) {
        New-Item -ItemType Directory -Force -Path $root | Out-Null
        $zip = Join-Path $root "maven.zip"
        Write-Host "Downloading Apache Maven 3.9.9 (one-time)..."
        Invoke-WebRequest -Uri "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.9/apache-maven-3.9.9-bin.zip" -OutFile $zip -UseBasicParsing
        Expand-Archive -Path $zip -DestinationPath $root -Force
        Remove-Item $zip -Force
    }
    return $mvnBat
}

$mvn = Get-MavenBin
& $mvn -B -DskipTests package
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host ""
Write-Host "WAR ready: target\PetHubProject.war"
Write-Host "Deploy to Tomcat 10 webapps\, or run docker compose from the repo root."
