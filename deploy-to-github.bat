@echo off
REM GitHub Pages Deployment Script for Windows
REM This script helps you deploy your YAML to .env converter to GitHub Pages

echo 🚀 YAML to .env Converter - GitHub Pages Deployment
echo =====================================================
echo.

REM Check if git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

echo ✅ Git is installed
echo.

REM Get GitHub username
set /p GITHUB_USERNAME="Enter your GitHub username: "
if "%GITHUB_USERNAME%"=="" (
    echo ❌ GitHub username is required
    pause
    exit /b 1
)

REM Get repository name
set /p REPO_NAME="Enter repository name (default: yaml-to-env-converter): "
if "%REPO_NAME%"=="" set REPO_NAME=yaml-to-env-converter

echo.
echo 📋 Deployment Configuration:
echo   GitHub Username: %GITHUB_USERNAME%
echo   Repository Name: %REPO_NAME%
echo   Repository URL: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo.

set /p CONFIRM="Continue with deployment? (y/n): "
if /i not "%CONFIRM%"=="y" (
    echo ❌ Deployment cancelled
    pause
    exit /b 0
)

echo.
echo 🔧 Updating configuration files...

REM Update index.html
powershell -Command "(Get-Content index.html) -replace 'yourusername', '%GITHUB_USERNAME%' | Set-Content index.html"

REM Update package.json
powershell -Command "(Get-Content package.json) -replace 'yourusername', '%GITHUB_USERNAME%' | Set-Content package.json"
powershell -Command "(Get-Content package.json) -replace 'yaml-to-env-converter', '%REPO_NAME%' | Set-Content package.json"

echo ✅ Configuration files updated
echo.

REM Initialize git repository
echo 📦 Initializing git repository...
git init

REM Add all files
echo 📁 Adding files to git...
git add .

REM Commit files
echo 💾 Committing files...
git commit -m "Initial commit - YAML to .env converter for GitHub Pages"

REM Add remote repository
echo 🔗 Adding remote repository...
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

REM Push to GitHub
echo 🚀 Pushing to GitHub...
git branch -M main
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo ❌ Failed to push to GitHub
    echo Please check:
    echo   1. Repository exists on GitHub
    echo   2. You have push permissions
    echo   3. Your GitHub credentials are configured
    echo.
    echo Manual steps:
    echo   1. Create repository: https://github.com/new
    echo   2. Run: git remote set-url origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git
    echo   3. Run: git push -u origin main
    pause
    exit /b 1
)

echo.
echo 🎉 Deployment successful!
echo.
echo 📋 Next steps:
echo   1. Go to: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo   2. Click "Settings" > "Pages"
echo   3. Select "Deploy from a branch"
echo   4. Choose "main" branch and "/ (root)" folder
echo   5. Click "Save"
echo.
echo 🌐 Your site will be available at:
echo   https://%GITHUB_USERNAME%.github.io/%REPO_NAME%/
echo.
echo 🔧 Converter direct link:
echo   https://%GITHUB_USERNAME%.github.io/%REPO_NAME%/yaml-to-env-converter.html
echo.
pause
