# PowerShell script to convert YAML to .env format
param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,
    
    [Parameter(Mandatory=$false)]
    [string]$OutputFile = ".env.converted"
)

# Check if input file exists
if (!(Test-Path $InputFile)) {
    Write-Error "Input file '$InputFile' not found"
    exit 1
}

# Function to convert YAML-style env to .env format
function Convert-YamlToEnv {
    param(
        [string]$YamlFile,
        [string]$EnvFile
    )
    
    try {
        # Read the YAML file
        $content = Get-Content $YamlFile -Raw
        
        # Parse the content (basic YAML parsing for env format)
        $envContent = ""
        
        # Split by lines and process each line
        $lines = $content -split "`n"
        
        $inEnvSection = $false
        $currentName = ""
        $currentValue = ""
        
        foreach ($line in $lines) {
            $line = $line.Trim()
            
            # Check if we're in the env section
            if ($line -eq "env:") {
                $inEnvSection = $true
                continue
            }
            
            # Skip empty lines and comments
            if ($line -eq "" -or $line.StartsWith("#")) {
                continue
            }
            
            # If we're in env section, process name-value pairs
            if ($inEnvSection) {
                if ($line.StartsWith("- name:")) {
                    # Extract name
                    $currentName = ($line -replace '- name:\s*"?([^"]+)"?.*', '$1').Trim()
                }
                elseif ($line.StartsWith("value:")) {
                    # Extract value
                    $currentValue = ($line -replace 'value:\s*"?([^"]*)"?.*', '$1').Trim()
                    
                    # Add to env content
                    if ($currentName -and $currentValue) {
                        $envContent += "$currentName=$currentValue`n"
                    }
                    
                    # Reset for next pair
                    $currentName = ""
                    $currentValue = ""
                }
            }
        }
        
        # Write to output file
        $envContent | Out-File -FilePath $EnvFile -Encoding UTF8
        
        Write-Host "✅ Successfully converted $YamlFile to $EnvFile" -ForegroundColor Green
        Write-Host "📄 Generated .env content:" -ForegroundColor Cyan
        Write-Host $envContent
        
    } catch {
        Write-Error "❌ Error converting YAML to .env: $($_.Exception.Message)"
        exit 1
    }
}

# Convert the file
Convert-YamlToEnv -YamlFile $InputFile -EnvFile $OutputFile
