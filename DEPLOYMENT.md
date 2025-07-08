# GitHub Pages Deployment Guide

## 🚀 Deploy Your YAML to .env Converter to GitHub Pages

### Prerequisites
- GitHub account
- Your project files ready

### Step 1: Create GitHub Repository

1. **Go to GitHub** and create a new repository
2. **Repository name**: `yaml-to-env-converter` (or your preferred name)
3. **Make it public** (required for free GitHub Pages)
4. **Initialize with README**: No (we have our own)

### Step 2: Push Your Code

```bash
# Initialize git repository
git init

# Add all files
git add .

# Commit files
git commit -m "Initial commit - YAML to .env converter"

# Add remote repository (replace with your GitHub username)
git remote add origin https://github.com/yourusername/yaml-to-env-converter.git

# Push to GitHub
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. **Go to your repository** on GitHub
2. **Click "Settings"** tab
3. **Scroll down to "Pages"** section
4. **Source**: Select "Deploy from a branch"
5. **Branch**: Select "main" (or "master")
6. **Folder**: Select "/ (root)"
7. **Click "Save"**

### Step 4: Configure GitHub Actions (Optional but Recommended)

The `.github/workflows/deploy.yml` file is already created. This will:
- Automatically deploy when you push to main branch
- Ensure your site is always up to date

### Step 5: Update Repository Links

After creating your repository, update these files:

1. **Update `index.html`** - Replace `yourusername` with your GitHub username:
   ```html
   <a href="https://github.com/yourusername/yaml-to-env-converter" target="_blank">
   ```

2. **Update `package.json`** - Replace repository URLs:
   ```json
   "repository": {
     "type": "git",
     "url": "git+https://github.com/yourusername/yaml-to-env-converter.git"
   }
   ```

3. **Update `README.md`** - Add your repository URL in the installation section

### Step 6: Access Your Site

After deployment (usually takes 5-10 minutes):
- **Your site will be available at**: `https://yourusername.github.io/yaml-to-env-converter/`
- **Check deployment status**: Go to "Actions" tab in your repository

### Step 7: Custom Domain (Optional)

If you have a custom domain:
1. **Add a `CNAME` file** in the root directory with your domain
2. **Configure DNS** to point to `yourusername.github.io`
3. **Update settings** in GitHub Pages section

## 🔧 File Structure for GitHub Pages

```
yaml-to-env-converter/
├── index.html                    # Main landing page
├── yaml-to-env-converter.html    # Converter tool
├── convert-yaml-to-env.js        # Node.js converter
├── yaml-to-env.bat              # Windows batch script
├── convert-yaml-to-env.ps1      # PowerShell script
├── package.json                 # Project metadata
├── README.md                    # Documentation
├── QUICKSTART.md               # Quick start guide
├── DEPLOYMENT.md               # This file
├── .github/workflows/deploy.yml # GitHub Actions workflow
└── examples/                   # Example files
    ├── secrets.yaml
    ├── kubernetes-config.yaml
    └── docker-compose.yaml
```

## 📋 Post-Deployment Checklist

- [ ] Repository created and code pushed
- [ ] GitHub Pages enabled
- [ ] Site accessible at GitHub Pages URL
- [ ] All links working correctly
- [ ] Converter tool functioning properly
- [ ] Example files accessible
- [ ] GitHub Actions workflow running successfully

## 🎯 Features Your Live Site Will Have

1. **Online Converter**: Direct access to the web tool
2. **Documentation**: Complete README and guides
3. **Examples**: Sample YAML files for testing
4. **Download Options**: Users can download CLI tools
5. **Responsive Design**: Works on all devices
6. **SEO Optimized**: Search engine friendly

## 🔄 Updating Your Site

After initial deployment, any push to the main branch will automatically update your live site:

```bash
# Make changes to your files
git add .
git commit -m "Update converter features"
git push origin main
```

## 🌟 Share Your Site

Once deployed, you can share:
- **Direct converter**: `https://yourusername.github.io/yaml-to-env-converter/yaml-to-env-converter.html`
- **Main site**: `https://yourusername.github.io/yaml-to-env-converter/`
- **GitHub repo**: `https://github.com/yourusername/yaml-to-env-converter`

## 🆘 Troubleshooting

**Site not loading?**
- Check GitHub Pages settings
- Verify files are in the root directory
- Wait 5-10 minutes for deployment

**JavaScript errors?**
- Ensure js-yaml CDN is accessible
- Check browser console for errors
- Verify all file paths are correct

**Links not working?**
- Update all `yourusername` references
- Check relative paths in HTML files
- Verify GitHub repository is public

---

**Your YAML to .env converter will be live and accessible to users worldwide! 🌍**
