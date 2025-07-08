# Quick Start Guide

## 🚀 Get Started in 3 Steps

### Step 1: Setup
**Windows:**
```batch
setup.bat
```

**macOS/Linux:**
```bash
chmod +x setup.sh
./setup.sh
```

**Manual Setup:**
```bash
npm install
```

### Step 2: Create Your YAML File
Create a file called `secrets.yaml`:
```yaml
DATABASE_URL: "postgresql://user:pass@localhost:5432/db"
API_KEY: "your-secret-key"
DEBUG: true
PORT: 3000
```

### Step 3: Convert to .env
```bash
# Using Node.js
node convert-yaml-to-env.js secrets.yaml .env

# Using Windows Batch
yaml-to-env.bat secrets.yaml .env

# Using npm script
npm run convert
```

## 📋 Common Commands

| Command | Description |
|---------|-------------|
| `npm run help` | Show help information |
| `npm run convert` | Convert using default files |
| `npm test` | Test with example files |
| `npm run watch` | Watch for file changes |
| `npm run backup` | Convert with backup |

## 🔧 Command Options

| Option | Description |
|--------|-------------|
| `--preview` | Show generated content before writing |
| `--backup` | Create backup of existing .env file |
| `--watch` | Monitor file changes and auto-convert |
| `--verbose` | Show detailed error messages |
| `--help` | Display help information |

## 📁 Example Files

After running setup, you'll have:
- `example.yaml` - Sample YAML configuration
- `example.env` - Generated .env file
- `README.md` - Full documentation

## 🆘 Need Help?

1. **Check if Node.js is installed**: `node --version`
2. **Install dependencies**: `npm install`
3. **Run with verbose output**: `--verbose` flag
4. **Check the full README.md** for detailed examples

## 🎯 Next Steps

1. **Customize your YAML** - Add your actual configuration
2. **Test the preview** - Use `--preview` to see output
3. **Set up watch mode** - Use `--watch` for automatic conversion
4. **Create backups** - Use `--backup` for safety

---

**That's it! Your YAML to .env converter is ready to use! 🎉**
