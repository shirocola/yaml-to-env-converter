@echo off
REM .env to YAML Converter - Windows Batch File
REM This script provides a convenient way to convert .env files to YAML format

REM Check if Node.js is available
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    exit /b 1
)

REM Check if the JavaScript converter exists
if not exist "convert-env-to-yaml.js" (
    echo ❌ convert-env-to-yaml.js not found in current directory
    echo Please ensure you're running this from the project root
    exit /b 1
)

REM Show help if no arguments provided
if "%~1"=="" (
    echo 🔧 .env to YAML Converter Tool ^(Windows Batch^)
    echo.
    echo Usage: env-to-yaml.bat ^<input-env-file^> [output-yaml-file] [options]
    echo.
    echo Options:
    echo   --nested           Convert underscore-separated keys to nested objects
    echo   --sort             Sort keys alphabetically in output
    echo   --preview          Preview the generated YAML content
    echo   --no-header        Skip adding header comments
    echo   --backup           Create backup of existing output file
    echo   --verbose          Show detailed error messages
    echo   --help             Show this help message
    echo.
    echo Examples:
    echo   env-to-yaml.bat .env config.yaml
    echo   env-to-yaml.bat .env config.yaml --preview
    echo   env-to-yaml.bat .env config.yaml --nested --sort
    echo.
    exit /b 0
)

REM Show help if requested
if "%~1"=="--help" (
    goto :show_help
)
if "%~1"=="-h" (
    goto :show_help
)

REM Pass all arguments to the Node.js script
node convert-env-to-yaml.js %*

REM Exit with the same code as the Node.js script
exit /b %errorlevel%

:show_help
echo 🔧 .env to YAML Converter Tool ^(Windows Batch^)
echo.
echo Usage: env-to-yaml.bat ^<input-env-file^> [output-yaml-file] [options]
echo.
echo Options:
echo   --nested           Convert underscore-separated keys to nested objects
echo   --sort             Sort keys alphabetically in output
echo   --preview          Preview the generated YAML content
echo   --no-header        Skip adding header comments
echo   --backup           Create backup of existing output file
echo   --verbose          Show detailed error messages
echo   --help             Show this help message
echo.
echo Examples:
echo   env-to-yaml.bat .env config.yaml
echo   env-to-yaml.bat .env config.yaml --preview
echo   env-to-yaml.bat .env config.yaml --nested --sort
echo.
echo 🔗 This batch file is a wrapper around convert-env-to-yaml.js
echo For more advanced usage, you can call the Node.js script directly:
echo   node convert-env-to-yaml.js --help
exit /b 0