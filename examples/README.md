# Examples Directory

This directory contains example YAML files demonstrating different use cases for the YAML to .env converter.

## 📁 Available Examples

### `secrets.yaml`
Basic application secrets and configuration:
- Database connections
- API keys
- OAuth credentials
- AWS configuration
- Third-party service keys

**Usage:**
```bash
node convert-yaml-to-env.js examples/secrets.yaml .env
```

### `kubernetes-config.yaml`
Kubernetes ConfigMap format:
- Standard key-value pairs
- Kubernetes-style env arrays
- Production configuration
- Microservice URLs

**Usage:**
```bash
node convert-yaml-to-env.js examples/kubernetes-config.yaml k8s.env
```

### `docker-compose.yaml`
Docker Compose nested configuration:
- Nested application settings
- Database primary/replica setup
- Cache configuration
- External service integration
- Feature flags

**Usage:**
```bash
node convert-yaml-to-env.js examples/docker-compose.yaml docker.env
```

## 🧪 Testing Examples

### Convert All Examples
```bash
# Convert secrets
node convert-yaml-to-env.js examples/secrets.yaml examples/secrets.env --preview

# Convert Kubernetes config
node convert-yaml-to-env.js examples/kubernetes-config.yaml examples/kubernetes.env --preview

# Convert Docker Compose config
node convert-yaml-to-env.js examples/docker-compose.yaml examples/docker.env --preview
```

### Batch Convert (Windows)
```batch
yaml-to-env.bat examples/secrets.yaml examples/secrets.env
yaml-to-env.bat examples/kubernetes-config.yaml examples/kubernetes.env
yaml-to-env.bat examples/docker-compose.yaml examples/docker.env
```

## 📋 Expected Output Formats

### Secrets → .env
```bash
DATABASE_URL="postgresql://user:password@localhost:5432/myapp"
API_KEY="sk-1234567890abcdef"
JWT_SECRET="your-super-secret-jwt-key"
# ... more variables
```

### Kubernetes → .env
```bash
APP_NAME="Production App"
APP_VERSION="2.1.0"
ENVIRONMENT="production"
MICROSERVICE_URL="https://microservice.production.example.com"
# ... more variables
```

### Docker Compose → .env
```bash
APP_NAME="Dockerized App"
APP_VERSION="1.5.0"
SERVER_HOST="0.0.0.0"
SERVER_PORT=3000
DATABASE_PRIMARY_HOST="db-primary"
DATABASE_PRIMARY_PORT=5432
# ... more variables (flattened from nested structure)
```

## 🎯 Creating Your Own Examples

1. **Copy an existing example** as a starting point
2. **Modify the configuration** to match your needs
3. **Test the conversion** with `--preview` flag
4. **Validate the output** before using in production

## 🔧 Advanced Usage

### Watch Mode
Monitor example files for changes:
```bash
node convert-yaml-to-env.js examples/secrets.yaml .env --watch
```

### Backup Mode
Create backups when converting:
```bash
node convert-yaml-to-env.js examples/secrets.yaml .env --backup
```

### Multiple Conversions
```bash
# Convert with different options
node convert-yaml-to-env.js examples/secrets.yaml dev.env --preview
node convert-yaml-to-env.js examples/kubernetes-config.yaml prod.env --backup
node convert-yaml-to-env.js examples/docker-compose.yaml docker.env --verbose
```
