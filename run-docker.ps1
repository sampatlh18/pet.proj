# Build and run Pet Hub (Tomcat + MySQL) in Docker.
# Requires Docker Desktop. Then open http://localhost:8080/PetHubProject/

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
docker compose up --build
