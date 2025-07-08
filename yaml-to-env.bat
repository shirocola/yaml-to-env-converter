@echo off
REM YAML to .env Converter Batch Tool
REM Usage: yaml-to-env.bat [input-file] [output-file] [options]

setlocal enabledelayedexpansion

REM Default values
set "INPUT_FILE=secrets.yaml"
set "OUTPUT_FILE=.env"
set "BACKUP=false"
set "PREVIEW=false"
set "WATCH=false"

REM Parse arguments
:parse_args
if "%~1"=="" goto :end_parse
if "%~1"=="--help" goto :show_help
if "%~1"=="-h" goto :show_help
if "%~1"=="--backup" set "BACKUP=true"
if "%~1"=="--preview" set "PREVIEW=true"
if "%~1"=="--watch" set "WATCH=true"
if "%~1"=="--verbose" set "VERBOSE=true"
if not "%~1"=="" if not "%~1"=="--backup" if not "%~1"=="--preview" if not "%~1"=="--watch" if not "%~1"=="--verbose" (
    if not defined FIRST_ARG (
        set "INPUT_FILE=%~1"
        set "FIRST_ARG=true"
    ) else (
        set "OUTPUT_FILE=%~1"
    )
)
shift
goto :parse_args

:end_parse

REM Check if Node.js is available
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    exit /b 1
)

REM Check if the converter script exists
if not exist "convert-yaml-to-env.js" (
    echo ❌ convert-yaml-to-env.js not found in current directory
    exit /b 1
)

REM Check if input file exists
if not exist "%INPUT_FILE%" (
    echo ❌ Input file "%INPUT_FILE%" not found
    exit /b 1
)

REM Build command
set "COMMAND=node convert-yaml-to-env.js %INPUT_FILE% %OUTPUT_FILE%"
if "%BACKUP%"=="true" set "COMMAND=%COMMAND% --backup"
if "%PREVIEW%"=="true" set "COMMAND=%COMMAND% --preview"
if "%WATCH%"=="true" set "COMMAND=%COMMAND% --watch"
if "%VERBOSE%"=="true" set "COMMAND=%COMMAND% --verbose"

REM Execute command
echo 🔄 Converting %INPUT_FILE% to %OUTPUT_FILE%...
%COMMAND%

goto :eof

:show_help
echo.
echo 🔧 YAML to .env Converter Batch Tool
echo.
echo Usage: yaml-to-env.bat [input-file] [output-file] [options]
echo.
echo Options:
echo   --help, -h          Show this help message
echo   --preview           Preview the generated .env content
echo   --verbose           Show detailed error messages
echo   --watch             Watch for changes and auto-convert
echo   --backup            Create backup of existing .env file
echo.
echo Examples:
echo   yaml-to-env.bat secrets.yaml .env
echo   yaml-to-env.bat secrets.yaml .env --preview
echo   yaml-to-env.bat secrets.yaml .env --backup --watch
echo.
exit /b 0
