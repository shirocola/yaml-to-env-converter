@echo off
REM YAML to .env Converter - Windows Setup Script
REM This script will help you get started with the project

echo 🚀 YAML to .env Converter Setup
echo ================================
echo.

REM Check if Node.js is installed
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed
    echo Please install Node.js from https://nodejs.org/
    echo Then run this script again.
    pause
    exit /b 1
)

REM Check if npm is installed
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed
    echo Please install npm (usually comes with Node.js^)
    pause
    exit /b 1
)

REM Display versions
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i

echo ✅ Node.js version: %NODE_VERSION%
echo ✅ npm version: %NPM_VERSION%
echo.

REM Install dependencies
echo 📦 Installing dependencies...
npm install

if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo ✅ Dependencies installed successfully!
echo.

REM Create example files
echo 📝 Creating example files...

REM Create example YAML file
(
echo # Example YAML configuration file
echo # This demonstrates different types of configurations
echo.
echo # Basic key-value pairs
echo APP_NAME: "My Application"
echo APP_VERSION: "1.0.0"
echo DEBUG: true
echo PORT: 3000
echo.
echo # Database configuration
echo database:
echo   host: "localhost"
echo   port: 5432
echo   name: "myapp"
echo   ssl: true
echo.
echo # API configuration
echo api:
echo   base_url: "https://api.example.com"
echo   timeout: 30
echo   retries: 3
echo.
echo # Kubernetes-style env array
echo env:
echo   - name: "REDIS_URL"
echo     value: "redis://localhost:6379"
echo   - name: "JWT_SECRET"
echo     value: "your-super-secret-jwt-key"
echo   - name: "OAUTH_CLIENT_ID"
echo     value: "your-oauth-client-id"
) > example.yaml

echo ✅ Created example.yaml

REM Test the conversion
echo.
echo 🧪 Testing the converter...
node convert-yaml-to-env.js example.yaml example.env --preview

if %errorlevel% neq 0 (
    echo ❌ Setup test failed
    pause
    exit /b 1
)

echo.
echo 🎉 Setup completed successfully!
echo.
echo 📋 Quick Start Commands:
echo   npm run help          # Show help
echo   npm run convert       # Convert using default files
echo   npm test             # Test with example files
echo   npm run watch        # Watch for changes
echo.
echo 🔧 Manual Usage:
echo   node convert-yaml-to-env.js input.yaml output.env
echo   yaml-to-env.bat input.yaml output.env
echo.
echo 📖 For more information, see README.md
echo.
pause
