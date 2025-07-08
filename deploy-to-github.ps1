# GitHub Pages Deployment Script for PowerShell
# This script helps you deploy your YAML to .env converter to GitHub Pages

Write-Host "🚀 YAML to .env Converter - GitHub Pages Deployment" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✅ Git is installed" -ForegroundColor Green
Write-Host ""

# Get GitHub username
$githubUsername = Read-Host "Enter your GitHub username"
if ([string]::IsNullOrWhiteSpace($githubUsername)) {
    Write-Host "❌ GitHub username is required" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Get repository name
$repoName = Read-Host "Enter repository name (default: yaml-to-env-converter)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "yaml-to-env-converter"
}

Write-Host ""
Write-Host "📋 Deployment Configuration:" -ForegroundColor Yellow
Write-Host "  GitHub Username: $githubUsername" -ForegroundColor White
Write-Host "  Repository Name: $repoName" -ForegroundColor White
Write-Host "  Repository URL: https://github.com/$githubUsername/$repoName" -ForegroundColor White
Write-Host ""

$confirm = Read-Host "Continue with deployment? (y/n)"
if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "❌ Deployment cancelled" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 0
}

Write-Host ""
Write-Host "🔧 Updating configuration files..." -ForegroundColor Yellow

try {
    # Update index.html
    if (Test-Path "index.html") {
        (Get-Content "index.html") -replace 'shirocola', $githubUsername | Set-Content "index.html"
        Write-Host "✅ Updated index.html" -ForegroundColor Green
    }

    # Update package.json
    if (Test-Path "package.json") {
        (Get-Content "package.json") -replace 'shirocola', $githubUsername | Set-Content "package.json"
        Write-Host "✅ Updated package.json" -ForegroundColor Green
    }

    Write-Host "✅ Configuration files updated" -ForegroundColor Green
    Write-Host ""

    # Initialize git repository
    Write-Host "📦 Initializing git repository..." -ForegroundColor Yellow
    git init

    # Add all files
    Write-Host "📁 Adding files to git..." -ForegroundColor Yellow
    git add .

    # Commit files
    Write-Host "💾 Committing files..." -ForegroundColor Yellow
    git commit -m "Initial commit - YAML to .env converter for GitHub Pages"

    # Add remote repository
    Write-Host "🔗 Adding remote repository..." -ForegroundColor Yellow
    git remote add origin "https://github.com/$githubUsername/$repoName.git"

    # Push to GitHub
    Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Yellow
    git branch -M main
    git push -u origin main

    Write-Host ""
    Write-Host "🎉 Deployment successful!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 Next steps:" -ForegroundColor Yellow
    Write-Host "  1. Go to: https://github.com/$githubUsername/$repoName" -ForegroundColor White
    Write-Host "  2. Click Settings > Pages" -ForegroundColor White
    Write-Host "  3. Select Deploy from a branch" -ForegroundColor White
    Write-Host "  4. Choose main branch and root folder" -ForegroundColor White
    Write-Host "  5. Click Save" -ForegroundColor White
    Write-Host ""
    Write-Host "🌐 Your site will be available at:" -ForegroundColor Cyan
    Write-Host "  https://$githubUsername.github.io/$repoName/" -ForegroundColor White
    Write-Host ""
    Write-Host "🔧 Converter direct link:" -ForegroundColor Cyan
    Write-Host "  https://$githubUsername.github.io/$repoName/yaml-to-env-converter.html" -ForegroundColor White
    Write-Host ""

} catch {
    Write-Host ""
    Write-Host "❌ Failed to deploy to GitHub" -ForegroundColor Red
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please check:" -ForegroundColor Yellow
    Write-Host "  1. Repository exists on GitHub" -ForegroundColor White
    Write-Host "  2. You have push permissions" -ForegroundColor White
    Write-Host "  3. Your GitHub credentials are configured" -ForegroundColor White
    Write-Host ""
    Write-Host "Manual steps:" -ForegroundColor Yellow
    Write-Host "  1. Create repository: https://github.com/new" -ForegroundColor White
    Write-Host "  2. Run: git remote set-url origin https://github.com/$githubUsername/$repoName.git" -ForegroundColor White
    Write-Host "  3. Run: git push -u origin main" -ForegroundColor White
    Write-Host ""
}

Read-Host "Press Enter to exit"
