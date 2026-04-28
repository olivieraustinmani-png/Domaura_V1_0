#!/usr/bin/env powershell
# ============================================
# DOMAURA v2 — Complete Monorepo Setup
# ============================================
# Run from: c:\Users\Austin\Desktop\Domaura_V1_0
# Copy-paste this entire script into PowerShell

$ErrorActionPreference = "Stop"
$WarningPreference = "SilentlyContinue"

Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║    DOMAURA v2 — Monorepo Setup Script       ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Change to project directory
Set-Location "C:\Users\Austin\Desktop\Domaura_V1_0" -ErrorAction SilentlyContinue

# ============================================
# CREATE FOLDER STRUCTURE
# ============================================
Write-Host "📁 Creating folder structure..." -ForegroundColor Yellow

# 00_gouvernance_projet
New-Item -ItemType Directory -Path "00_gouvernance_projet/decisions_architecture_ADR" -Force | Out-Null

# 01_documentation
New-Item -ItemType Directory -Path "01_documentation/cahier_des_charges" -Force | Out-Null
New-Item -ItemType Directory -Path "01_documentation/prd_specifications_produit" -Force | Out-Null
New-Item -ItemType Directory -Path "01_documentation/user_stories" -Force | Out-Null
New-Item -ItemType Directory -Path "01_documentation/parcours_utilisateurs_user_flows" -Force | Out-Null
New-Item -ItemType Directory -Path "01_documentation/wiki_interne" -Force | Out-Null

# 02_architecture_logicielle
New-Item -ItemType Directory -Path "02_architecture_logicielle/uml/use_case" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/uml/class_diagrams" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/uml/sequence_diagrams" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/uml/activity_diagrams" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/architecture_systeme" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/ddd_domain_model" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/schemas_api" -Force | Out-Null
New-Item -ItemType Directory -Path "02_architecture_logicielle/architecture_infrastructure" -Force | Out-Null

# 03_base_de_donnees
New-Item -ItemType Directory -Path "03_base_de_donnees/modelisation_sql" -Force | Out-Null
New-Item -ItemType Directory -Path "03_base_de_donnees/migrations" -Force | Out-Null
New-Item -ItemType Directory -Path "03_base_de_donnees/seeders" -Force | Out-Null
New-Item -ItemType Directory -Path "03_base_de_donnees/schemas_postgresql" -Force | Out-Null
New-Item -ItemType Directory -Path "03_base_de_donnees/redis_events" -Force | Out-Null

# 04_applications
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/lib/coeur_core" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/lib/modules/domaura_home" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/lib/modules/domaura_market" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/lib/modules/domaura_services" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/lib/shared_widgets" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/lib/services" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/mobile_flutter/test" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/web_nextjs/app" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/web_nextjs/components" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/web_nextjs/services" -Force | Out-Null
New-Item -ItemType Directory -Path "04_applications/web_nextjs/public" -Force | Out-Null

# 05_microservices_backend (RENAMED!)
New-Item -ItemType Directory -Path "05_microservices_backend/api_gateway" -Force | Out-Null
New-Item -ItemType Directory -Path "05_microservices_backend/auth_service" -Force | Out-Null
New-Item -ItemType Directory -Path "05_microservices_backend/listings_service" -Force | Out-Null
New-Item -ItemType Directory -Path "05_microservices_backend/payments_service" -Force | Out-Null
New-Item -ItemType Directory -Path "05_microservices_backend/chat_service" -Force | Out-Null
New-Item -ItemType Directory -Path "05_microservices_backend/trust_scoring_service" -Force | Out-Null
New-Item -ItemType Directory -Path "05_microservices_backend/ai_domaura_service" -Force | Out-Null

# 06_packages_partages_shared
New-Item -ItemType Directory -Path "06_packages_partages_shared/shared_models" -Force | Out-Null
New-Item -ItemType Directory -Path "06_packages_partages_shared/shared_ui" -Force | Out-Null
New-Item -ItemType Directory -Path "06_packages_partages_shared/shared_utils" -Force | Out-Null
New-Item -ItemType Directory -Path "06_packages_partages_shared/sdk_interne" -Force | Out-Null

# 07_design_ux_ui
New-Item -ItemType Directory -Path "07_design_ux_ui/figma_specs" -Force | Out-Null
New-Item -ItemType Directory -Path "07_design_ux_ui/design_system" -Force | Out-Null
New-Item -ItemType Directory -Path "07_design_ux_ui/wireframes" -Force | Out-Null
New-Item -ItemType Directory -Path "07_design_ux_ui/prototypes" -Force | Out-Null

# 08_tests_qualite
New-Item -ItemType Directory -Path "08_tests_qualite/unitaires" -Force | Out-Null
New-Item -ItemType Directory -Path "08_tests_qualite/integration" -Force | Out-Null
New-Item -ItemType Directory -Path "08_tests_qualite/e2e" -Force | Out-Null
New-Item -ItemType Directory -Path "08_tests_qualite/performance" -Force | Out-Null

# 09_devops_infrastructure
New-Item -ItemType Directory -Path "09_devops_infrastructure/docker" -Force | Out-Null
New-Item -ItemType Directory -Path "09_devops_infrastructure/kubernetes" -Force | Out-Null
New-Item -ItemType Directory -Path "09_devops_infrastructure/ci_cd" -Force | Out-Null
New-Item -ItemType Directory -Path "09_devops_infrastructure/monitoring" -Force | Out-Null
New-Item -ItemType Directory -Path "09_devops_infrastructure/aws" -Force | Out-Null

# 10_assets_ressources
New-Item -ItemType Directory -Path "10_assets_ressources/images" -Force | Out-Null
New-Item -ItemType Directory -Path "10_assets_ressources/icones" -Force | Out-Null
New-Item -ItemType Directory -Path "10_assets_ressources/logos" -Force | Out-Null
New-Item -ItemType Directory -Path "10_assets_ressources/medias" -Force | Out-Null

# 11_scripts_outils
New-Item -ItemType Directory -Path "11_scripts_outils/setup" -Force | Out-Null
New-Item -ItemType Directory -Path "11_scripts_outils/deployment" -Force | Out-Null
New-Item -ItemType Directory -Path "11_scripts_outils/maintenance" -Force | Out-Null

# 12_fundraising_incubateur
New-Item -ItemType Directory -Path "12_fundraising_incubateur/pitch_deck" -Force | Out-Null
New-Item -ItemType Directory -Path "12_fundraising_incubateur/dossier_orange" -Force | Out-Null
New-Item -ItemType Directory -Path "12_fundraising_incubateur/business_model" -Force | Out-Null
New-Item -ItemType Directory -Path "12_fundraising_incubateur/data_room" -Force | Out-Null

# 13_security_securite (NEW!)
New-Item -ItemType Directory -Path "13_security_securite/auth" -Force | Out-Null
New-Item -ItemType Directory -Path "13_security_securite/kyc" -Force | Out-Null
New-Item -ItemType Directory -Path "13_security_securite/compliance" -Force | Out-Null

# 14_observabilite_monitoring (NEW!)
New-Item -ItemType Directory -Path "14_observabilite_monitoring/logs" -Force | Out-Null
New-Item -ItemType Directory -Path "14_observabilite_monitoring/metrics" -Force | Out-Null
New-Item -ItemType Directory -Path "14_observabilite_monitoring/alerts" -Force | Out-Null

# 15_recherche_rnd (NEW!)
New-Item -ItemType Directory -Path "15_recherche_rnd/ia" -Force | Out-Null
New-Item -ItemType Directory -Path "15_recherche_rnd/vr_3d" -Force | Out-Null

Write-Host "✅ All folders created!" -ForegroundColor Green
Write-Host ""
Write-Host "🚀 Structure créée avec succès!" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Summary:" -ForegroundColor Cyan
Write-Host "  • 15 main sections created" -ForegroundColor White
Write-Host "  • 55+ subfolders created" -ForegroundColor White
Write-Host "  • Ready for Flutter, Next.js, NestJS" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Review the structure" -ForegroundColor White
Write-Host "  2. Create root files (README, docker-compose, etc.)" -ForegroundColor White
Write-Host "  3. Run: git init && git add . && git commit -m 'Initial structure'" -ForegroundColor White
Write-Host ""
