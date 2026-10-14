<#
.SYNOPSIS
    Automated GitHub Pages Deployment Script for AI Portfolio
.DESCRIPTION
    Initializes git repository, commits portfolio assets, binds remote origin,
    and pushes to main branch for instant GitHub Pages hosting.
#>

[CmdletBinding()]
param(
    [string]$RepoUrl = ""
)

Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host "       MICHAEL ANGELO 'MEEKO' SAPNIT - AI PORTFOLIO DEPLOYMENT" -ForegroundColor White
Write-Host "                     Target Host: GitHub Pages" -ForegroundColor Green
Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host ""

$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed or not in PATH. Please install Git first."
    exit 1
}

Write-Host "[1/4] Initializing local git repository..." -ForegroundColor Yellow
if (-not (Test-Path ".git")) {
    git init
    git branch -M main
    Write-Host "Initialized new git repository." -ForegroundColor Green
} else {
    Write-Host "Existing git repository found." -ForegroundColor DarkGray
}

Write-Host "`n[2/4] Staging and committing files..." -ForegroundColor Yellow
git add .
$status = git status --porcelain
if ($status) {
    git commit -m "Deploy AI Portfolio showcase to GitHub Pages"
    Write-Host "Committed updates successfully." -ForegroundColor Green
} else {
    Write-Host "Working tree clean, no new changes to commit." -ForegroundColor DarkGray
}

Write-Host "`n[3/4] Configuring remote origin..." -ForegroundColor Yellow
$currentOrigin = git remote get-url origin 2>$null
if (-not $currentOrigin) {
    if (-not $RepoUrl) {
        Write-Host "No remote origin configured." -ForegroundColor DarkYellow
        Write-Host "1. Create a repository on GitHub (e.g. 'ai-portfolio' or '<username>.github.io')" -ForegroundColor White
        Write-Host "2. Copy the repository URL (HTTPS or SSH)" -ForegroundColor White
        $RepoUrl = Read-Host "Paste your GitHub Repository URL"
    }

    if ([string]::IsNullOrWhiteSpace($RepoUrl)) {
        Write-Error "No repository URL provided. Aborting."
        exit 1
    }

    git remote add origin $RepoUrl.Trim()
    Write-Host "Remote origin set to $RepoUrl" -ForegroundColor Green
} else {
    Write-Host "Using configured remote: $currentOrigin" -ForegroundColor Green
}

Write-Host "`n[4/4] Pushing to GitHub (branch: main)..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n==============================================================================" -ForegroundColor Green
    Write-Host "                     DEPLOYMENT PUSH SUCCESSFUL!" -ForegroundColor White
    Write-Host "==============================================================================" -ForegroundColor Green
    Write-Host "`nFinal 30-Second Step to Activate GitHub Pages:" -ForegroundColor Cyan
    Write-Host "1. Go to your repository on GitHub.com"
    Write-Host "2. Click 'Settings' -> 'Pages' (in the left sidebar menu)"
    Write-Host "3. Under 'Build and deployment' -> 'Source', select 'Deploy from a branch'"
    Write-Host "4. Select Branch: 'main' and Folder: '/ (root)' -> Click 'Save'"
    Write-Host "`nYour site will be live at: https://<your-username>.github.io/ai-portfolio/`n" -ForegroundColor Green
} else {
    Write-Warning "Push encountered an error. Ensure you are logged into Git / GitHub credentials."
}
