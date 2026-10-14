@echo off
setlocal enabledelayedexpansion
title Deploy AI Portfolio to GitHub Pages

echo ==============================================================================
echo        MICHAEL ANGELO "MEEKO" SAPNIT - AI PORTFOLIO DEPLOYMENT
echo                      Target Host: GitHub Pages
echo ==============================================================================
echo.

cd /d "%~dp0"

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git was not found in your PATH!
    echo Please install Git or add it to PATH.
    pause
    exit /b 1
)

echo [1/5] Checking Git identity...
git config user.name >nul 2>nul
if %errorlevel% neq 0 (
    echo Setting default local Git author name and email...
    git config user.name "Michael Angelo Sapnit"
    git config user.email "sapnit.michaelangelo@gmail.com"
)

echo.
echo [2/5] Initializing local repository...
if not exist ".git" (
    git init
    git branch -M main
    echo Repository initialized.
) else (
    echo Existing git repository detected.
)

echo.
echo [3/5] Staging and committing files...
git add .
git commit -m "Deploy AI Portfolio showcase to GitHub Pages" 2>nul
if %errorlevel% equ 0 (
    echo Changes committed successfully.
) else (
    echo Working tree up-to-date.
)

echo.
echo [4/5] Checking remote origin...
git remote get-url origin >nul 2>nul
if %errorlevel% neq 0 (
    echo No remote origin detected.
    echo.
    echo Please create a new public repository on GitHub:
    echo   1. Visit: https://github.com/new
    echo   2. Name it: ai-portfolio  (or your-username.github.io)
    echo   3. Do NOT initialize with README, .gitignore, or license
    echo   4. Click "Create repository"
    echo.
    set /p REPO_URL="Paste your GitHub repository HTTPS or SSH URL: "
    if "!REPO_URL!"=="" (
        echo [ERROR] No URL provided. Aborting.
        pause
        exit /b 1
    )
    git remote add origin !REPO_URL!
    echo Remote origin set to !REPO_URL!
) else (
    for /f "tokens=*" %%a in ('git remote get-url origin') do set CURRENT_URL=%%a
    echo Using existing remote: !CURRENT_URL!
)

echo.
echo [5/5] Pushing to GitHub (branch: main)...
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo [!] Push failed or requires authentication.
    echo If prompted by GitHub, sign in via your browser or Personal Access Token.
    pause
    exit /b 1
)

echo.
echo ==============================================================================
echo                      DEPLOYMENT SUCCESSFUL!
echo ==============================================================================
echo.
echo Next step to activate GitHub Pages:
echo   1. Open your repository on GitHub.
echo   2. Click 'Settings' -^> 'Pages' (in left sidebar).
echo   3. Under 'Build and deployment' -^> 'Source', select 'Deploy from a branch'.
echo   4. Set Branch to 'main' and Folder to '/ (root)', then click 'Save'.
echo.
echo Your portfolio will be live at:
echo   https://^<your-github-username^>.github.io/ai-portfolio/
echo.
echo ==============================================================================
pause
