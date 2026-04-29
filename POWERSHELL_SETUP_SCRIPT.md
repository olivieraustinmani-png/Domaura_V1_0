# 🔧 DOMAURA — PowerShell Script Complet

**Pour recréer toute la structure DOMAURA depuis zéro**

---

## 🚀 Script Complet (Copier-Coller)

```powershell
# ============================================
# DOMAURA MONOREPO — Complete Setup Script
# ============================================
# Run from parent directory of DOMAURA
# Example: C:\Users\Austin\Desktop\

cd C:\Users\Austin\Desktop\Domaura_V1_0

# ============================================
# 1. CREATE FOLDER STRUCTURE
# ============================================

Write-Host "Creating folder structure..." -ForegroundColor Green

# 00_gouvernance_projet
New-Item -ItemType Directory -Path '00_gouvernance_projet/decisions_architecture_ADR' -Force | Out-Null

# 01_documentation
New-Item -ItemType Directory -Path '01_documentation/cahier_des_charges' -Force | Out-Null
New-Item -ItemType Directory -Path '01_documentation/prd_specifications_produit' -Force | Out-Null
New-Item -ItemType Directory -Path '01_documentation/user_stories' -Force | Out-Null
New-Item -ItemType Directory -Path '01_documentation/parcours_utilisateurs_user_flows' -Force | Out-Null
New-Item -ItemType Directory -Path '01_documentation/wiki_interne' -Force | Out-Null

# 02_architecture_logicielle
New-Item -ItemType Directory -Path '02_architecture_logicielle/uml/use_case' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/uml/class_diagrams' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/uml/sequence_diagrams' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/uml/activity_diagrams' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/architecture_systeme' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/ddd_domain_model' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/schemas_api' -Force | Out-Null
New-Item -ItemType Directory -Path '02_architecture_logicielle/architecture_infrastructure' -Force | Out-Null

# 03_base_de_donnees
New-Item -ItemType Directory -Path '03_base_de_donnees/modelisation_sql' -Force | Out-Null
New-Item -ItemType Directory -Path '03_base_de_donnees/migrations' -Force | Out-Null
New-Item -ItemType Directory -Path '03_base_de_donnees/seeders' -Force | Out-Null
New-Item -ItemType Directory -Path '03_base_de_donnees/schemas_postgresql' -Force | Out-Null
New-Item -ItemType Directory -Path '03_base_de_donnees/redis_events' -Force | Out-Null

# 04_applications
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/lib/coeur_core' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/lib/modules/domaura_home' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/lib/modules/domaura_market' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/lib/modules/domaura_services' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/lib/shared_widgets' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/lib/services' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/mobile_flutter/test' -Force | Out-Null

New-Item -ItemType Directory -Path '04_applications/web_nextjs/app' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/web_nextjs/components' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/web_nextjs/services' -Force | Out-Null
New-Item -ItemType Directory -Path '04_applications/web_nextjs/public' -Force | Out-Null

# 05_backend_services
New-Item -ItemType Directory -Path '05_backend_services/api_gateway' -Force | Out-Null
New-Item -ItemType Directory -Path '05_backend_services/auth_service' -Force | Out-Null
New-Item -ItemType Directory -Path '05_backend_services/listings_service' -Force | Out-Null
New-Item -ItemType Directory -Path '05_backend_services/payments_service' -Force | Out-Null
New-Item -ItemType Directory -Path '05_backend_services/chat_service' -Force | Out-Null
New-Item -ItemType Directory -Path '05_backend_services/trust_scoring_service' -Force | Out-Null
New-Item -ItemType Directory -Path '05_backend_services/ai_domaura_service' -Force | Out-Null

# 06_packages_partages_shared
New-Item -ItemType Directory -Path '06_packages_partages_shared/shared_models' -Force | Out-Null
New-Item -ItemType Directory -Path '06_packages_partages_shared/shared_ui' -Force | Out-Null
New-Item -ItemType Directory -Path '06_packages_partages_shared/shared_utils' -Force | Out-Null
New-Item -ItemType Directory -Path '06_packages_partages_shared/sdk_interne' -Force | Out-Null

# 07_design_ux_ui
New-Item -ItemType Directory -Path '07_design_ux_ui/figma_specs' -Force | Out-Null
New-Item -ItemType Directory -Path '07_design_ux_ui/design_system' -Force | Out-Null
New-Item -ItemType Directory -Path '07_design_ux_ui/wireframes' -Force | Out-Null
New-Item -ItemType Directory -Path '07_design_ux_ui/prototypes' -Force | Out-Null

# 08_tests_qualite
New-Item -ItemType Directory -Path '08_tests_qualite/unitaires' -Force | Out-Null
New-Item -ItemType Directory -Path '08_tests_qualite/integration' -Force | Out-Null
New-Item -ItemType Directory -Path '08_tests_qualite/e2e' -Force | Out-Null
New-Item -ItemType Directory -Path '08_tests_qualite/performance' -Force | Out-Null

# 09_devops_infrastructure
New-Item -ItemType Directory -Path '09_devops_infrastructure/docker' -Force | Out-Null
New-Item -ItemType Directory -Path '09_devops_infrastructure/kubernetes' -Force | Out-Null
New-Item -ItemType Directory -Path '09_devops_infrastructure/ci_cd' -Force | Out-Null
New-Item -ItemType Directory -Path '09_devops_infrastructure/monitoring' -Force | Out-Null
New-Item -ItemType Directory -Path '09_devops_infrastructure/aws' -Force | Out-Null

# 10_assets_ressources
New-Item -ItemType Directory -Path '10_assets_ressources/images' -Force | Out-Null
New-Item -ItemType Directory -Path '10_assets_ressources/icones' -Force | Out-Null
New-Item -ItemType Directory -Path '10_assets_ressources/logos' -Force | Out-Null
New-Item -ItemType Directory -Path '10_assets_ressources/medias' -Force | Out-Null

# 11_scripts_outils
New-Item -ItemType Directory -Path '11_scripts_outils/setup' -Force | Out-Null
New-Item -ItemType Directory -Path '11_scripts_outils/deployment' -Force | Out-Null
New-Item -ItemType Directory -Path '11_scripts_outils/maintenance' -Force | Out-Null

# 12_fundraising_incubateur
New-Item -ItemType Directory -Path '12_fundraising_incubateur/pitch_deck' -Force | Out-Null
New-Item -ItemType Directory -Path '12_fundraising_incubateur/dossier_orange' -Force | Out-Null
New-Item -ItemType Directory -Path '12_fundraising_incubateur/business_model' -Force | Out-Null
New-Item -ItemType Directory -Path '12_fundraising_incubateur/data_room' -Force | Out-Null

Write-Host "✅ Folder structure created!" -ForegroundColor Green

# ============================================
# 2. CREATE .gitignore
# ============================================

$gitignore = @"
# Environment
.env
.env.local
.env.*.local
.env.production

# Dependencies
node_modules/
pubspec.lock
Pods/
.symlinks/
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
build/
dist/

# IDE
.idea/
.vscode/
*.swp
*.swo
*~
.DS_Store
*.iml
.gradle/
local.properties

# Flutter
flutter_export_environment.sh
.fvm/
.fvm/flutter_sdk

# Next.js
.next/
out/

# NestJS
dist/

# Logs
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# OS
.DS_Store
Thumbs.db

# Tests
coverage/
.nyc_output/

# Cache
.cache/
.eslintcache

# Uploads
uploads/
public/uploads/

# Sensitive
*.key
*.pem
*.crt
secrets/
"@

Set-Content -Path '.gitignore' -Value $gitignore -Encoding UTF8
Write-Host "✅ .gitignore created" -ForegroundColor Green

# ============================================
# 3. CREATE .env.example
# ============================================

$env_example = @"
# APPLICATION
NODE_ENV=development
APP_NAME=DOMAURA
APP_PORT=3000

# DATABASE
DB_HOST=localhost
DB_PORT=5432
DB_USERNAME=domaura_user
DB_PASSWORD=change_me_in_production
DB_NAME=domaura_dev

# REDIS
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=change_me_in_production

# JWT
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRATION=7d

# FIREBASE
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_PROJECT_ID=your_firebase_project_id

# CLOUDINARY
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key

# PAYMENT
ORANGE_MONEY_API_KEY=your_key
MTN_MOMO_API_KEY=your_key

# AWS
AWS_REGION=us-east-1
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
"@

Set-Content -Path '.env.example' -Value $env_example -Encoding UTF8
Write-Host "✅ .env.example created" -ForegroundColor Green

Write-Host ""
Write-Host "╔═══════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║     DOMAURA Structure Setup Complete!     ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review and complete other setup files (README, Makefile, etc.)"
Write-Host "2. cp .env.example .env"
Write-Host "3. Edit .env with your credentials"
Write-Host "4. docker-compose up -d"
Write-Host "5. make db:setup"
Write-Host ""
```

---

## 📋 Manual Verification

After running the script:

```powershell
# Check folder count (should be 13+)
Get-ChildItem -Directory | Measure-Object

# Check root files
Get-ChildItem -File | Select-Object Name

# Verify structure
Get-ChildItem -Recurse -Directory | Measure-Object
```

---

## 🎯 What Gets Created

**Total Folders**: 50+  
**Total Root Files**: 9  
**Structure Levels**: 3-4 deep  
**Ready for**: Immediate development  

---

## 📝 Additional Files

These are created separately (not in script):

- ✅ README.md
- ✅ ROADMAP.md
- ✅ CONTRIBUTING.md
- ✅ SETUP.md
- ✅ STRUCTURE_CREATED.md
- ✅ docker-compose.yml
- ✅ Makefile

---

## 💡 Tips

- Save this script as `setup.ps1`
- Run: `powershell -ExecutionPolicy Bypass -File setup.ps1`
- Or copy-paste section by section
- All operations are idempotent (safe to re-run)

---

*PowerShell Script v1.0 — April 2026*
