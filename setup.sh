#!/bin/bash

# YAML to .env Converter - Setup Script
# This script will help you get started with the project

echo "🚀 YAML to .env Converter Setup"
echo "================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed"
    echo "Please install Node.js from https://nodejs.org/"
    echo "Then run this script again."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed"
    echo "Please install npm (usually comes with Node.js)"
    exit 1
fi

# Display versions
echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""

# Create example files
echo "📝 Creating example files..."

# Create example YAML file
cat > example.yaml << 'EOF'
# Example YAML configuration file
# This demonstrates different types of configurations

# Basic key-value pairs
APP_NAME: "My Application"
APP_VERSION: "1.0.0"
DEBUG: true
PORT: 3000

# Database configuration
database:
  host: "localhost"
  port: 5432
  name: "myapp"
  ssl: true

# API configuration
api:
  base_url: "https://api.example.com"
  timeout: 30
  retries: 3

# Kubernetes-style env array
env:
  - name: "REDIS_URL"
    value: "redis://localhost:6379"
  - name: "JWT_SECRET"
    value: "your-super-secret-jwt-key"
  - name: "OAUTH_CLIENT_ID"
    value: "your-oauth-client-id"
EOF

echo "✅ Created example.yaml"

# Test the conversion
echo ""
echo "🧪 Testing the converter..."
node convert-yaml-to-env.js example.yaml example.env --preview

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Setup completed successfully!"
    echo ""
    echo "📋 Quick Start Commands:"
    echo "  npm run help          # Show help"
    echo "  npm run convert       # Convert using default files"
    echo "  npm test             # Test with example files"
    echo "  npm run watch        # Watch for changes"
    echo ""
    echo "🔧 Manual Usage:"
    echo "  node convert-yaml-to-env.js input.yaml output.env"
    echo "  ./yaml-to-env.bat input.yaml output.env"
    echo ""
    echo "📖 For more information, see README.md"
else
    echo "❌ Setup test failed"
    exit 1
fi
