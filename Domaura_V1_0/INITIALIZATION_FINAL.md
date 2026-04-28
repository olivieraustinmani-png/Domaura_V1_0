# ⚡ DOMAURA v2 — INITIALIZATION COMMANDS

> **Complete setup in the recommended order for CTO-level startup**

---

## 🚀 STEP 1: Initialize Structure (5 min)

```powershell
# Run PowerShell script to create all folders
cd C:\Users\Austin\Desktop\Domaura_V1_0
pwsh -ExecutionPolicy Bypass -File "SETUP_FINAL.ps1"

# Verify all folders created
Get-ChildItem -Directory | Measure-Object
# Should show 15+ directories
```

---

## 📱 STEP 2: Initialize Flutter (10 min)

```bash
# Create Flutter project in correct location
cd 04_applications
flutter create mobile_flutter --project-name domaura --org com.domaura

# Navigate to Flutter project
cd mobile_flutter

# Get dependencies
flutter pub get

# Verify installation
flutter doctor
# All checks should be ✓ green
```

---

## 🌐 STEP 3: Initialize Next.js (10 min)

```bash
# Create Next.js project in correct location
cd 04_applications
npx create-next-app@latest web_nextjs \
  --typescript \
  --tailwind \
  --app \
  --eslint \
  --git false

# Navigate to project
cd web_nextjs

# Install dependencies (if not done automatically)
npm install

# Verify
npm run dev
# Should start on http://localhost:3000
```

---

## 🔌 STEP 4: Initialize NestJS API Gateway (10 min)

```bash
# Navigate to microservices
cd 05_microservices_backend/api_gateway

# Create NestJS project
npx @nestjs/cli@latest new . --skip-git --package-manager npm

# Install dependencies
npm install

# Verify installation
npm run start:dev
# Should show Nest application successfully started on port 3000

# Stop for now (Ctrl+C)
```

---

## 🔐 STEP 5: Initialize Other Microservices (Optional)

```bash
# Create structure for other services (they'll use API gateway initially)
cd 05_microservices_backend

# Create placeholder package.json for each service
for service in auth_service listings_service payments_service chat_service trust_scoring_service ai_domaura_service; do
  mkdir -p "$service/src"
  echo '{"name":"'$service'","version":"1.0.0"}' > "$service/package.json"
done

# These can be developed incrementally as monolithic features first
# Then extracted as true microservices in Phase 2
```

---

## 🗄️ STEP 6: Initialize Database & Docker (15 min)

```bash
# From project root
cd c:\Users\Austin\Desktop\Domaura_V1_0

# Copy and edit environment
cp .env.example .env

# ⚠️ IMPORTANT: Edit .env with your credentials
nano .env
# or with your favorite editor

# Start Docker services
docker-compose up -d

# Verify services running
docker ps
# Should show: postgres, redis, pgadmin, redis-commander, prometheus, grafana

# Initialize database (after PostgreSQL health check)
cd 05_microservices_backend/api_gateway
npm run typeorm migration:run
npm run seed

# If using make command:
make db:setup
```

---

## 📝 STEP 7: Git Configuration (10 min)

```bash
# Initialize Git from project root
cd c:\Users\Austin\Desktop\Domaura_V1_0

# Initialize repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "feat: initial domaura v2 monorepo architecture

- 15 main sections (governance, docs, architecture, db, apps, services, shared, design, tests, devops, assets, scripts, fundraising, security, observability, rnd)
- Flutter mobile application structure
- Next.js web application structure
- NestJS microservices architecture (API Gateway + 6 services)
- Complete Docker infrastructure (PostgreSQL, Redis, monitoring)
- Production-grade configuration files
- Comprehensive documentation and conventions"

# Create develop branch
git branch develop

# Switch to develop (default working branch)
git checkout develop

# Create GitHub repository
# Visit https://github.com/new
# Create 'domaura' repository
# Copy HTTPS URL

# Add remote
git remote add origin https://github.com/YOUR_ORG/domaura.git

# Push all branches
git push -u origin main develop

# Verify
git branch -a
# Should show: main, develop, remotes/origin/main, remotes/origin/develop
```

---

## 🔀 GIT WORKFLOW & CONVENTIONS

### **Branch Strategy**

```
main/
  ↓ (production releases only, tagged)
  
develop/
  ↓ (integration branch)
  
  ├─ feature/user-authentication
  ├─ feature/marketplace-listings
  ├─ feature/payment-integration
  │
  ├─ bugfix/auth-timeout-issue
  ├─ bugfix/payment-race-condition
  │
  └─ hotfix/security-vulnerability (from main if urgent)
```

### **Branch Naming Conventions**

```
feature/<feature-name>          # New features
bugfix/<bug-description>        # Bug fixes (from develop)
hotfix/<issue-description>      # Urgent fixes (from main)
refactor/<area>                 # Code refactoring
docs/<documentation-name>       # Documentation only
test/<test-description>         # Test changes
chore/<task-description>        # Maintenance, dependencies
```

### **Creating a Feature Branch**

```bash
# Update develop first
git checkout develop
git pull origin develop

# Create feature branch
git checkout -b feature/add-kyc-verification

# Make changes, test, commit
git add .
git commit -m "feat(security): add KYC verification flow for users

- Implement KYC data collection form
- Add verification workflow
- Integrate with trust scoring service
- Add comprehensive tests

Refs: #123"

# Push to remote
git push origin feature/add-kyc-verification

# Open Pull Request on GitHub
# → develop branch (NOT main)
```

### **Commit Message Format (Conventional Commits)**

```
<type>(<scope>): <subject>

<body>

<footer>

Examples:

feat(auth): implement two-factor authentication
fix(payments): resolve race condition in escrow release
docs(readme): update installation instructions
refactor(api): simplify user service logic
perf(database): optimize listings query
test(mobile): add flutter widget tests
chore(deps): upgrade dependencies
```

### **Type Conventions**

```
feat        New feature
fix         Bug fix
docs        Documentation only
refactor    Code refactoring (no behavior change)
perf        Performance improvements
test        Adding or updating tests
chore       Build, dependencies, tooling
ci          CI/CD configuration
style       Code formatting (not logic)
```

### **Scope Examples**

```
(auth)              Authentication module
(payments)          Payment processing
(listings)          Property listings
(marketplace)       General marketplace
(flutter)           Mobile app
(nextjs)            Web app
(nestjs)            Backend API
(database)          Database/migrations
(devops)            Infrastructure/docker
(security)          Security features
(rnd)               Research & development
```

### **Making a Pull Request**

```bash
# When your feature is complete:

# 1. Ensure all tests pass
npm run test

# 2. Format and lint code
npm run lint:fix

# 3. Pull latest develop
git fetch origin
git rebase origin/develop

# 4. Push to remote
git push origin feature/your-feature --force-with-lease

# 5. On GitHub:
#    - Create Pull Request
#    - Target: develop (NOT main)
#    - Title: Same as last commit
#    - Description: Explain what changed and why
#    - Link related issues: "Fixes #123"

# 6. Wait for:
#    - ✅ Tests passing
#    - ✅ Code review (minimum 1 reviewer)
#    - ✅ All conversations resolved

# 7. Once approved, "Squash and merge" or "Rebase and merge"
```

### **Releasing to Production (main)**

```bash
# Only Release Manager does this:

git checkout main
git pull origin main

# Merge develop into main (via PR with full team review)
git merge origin/develop

# Tag release
git tag -a v1.0.0 -m "Release version 1.0.0

Features:
- Initial MVP with Home, Market, Services
- User authentication
- Marketplace with payments
- Trust scoring

Breaking Changes:
- None

Migration:
- Run: npm run migrate:latest"

# Push
git push origin main --tags

# Deploy to production
make deploy:prod
```

### **Hotfix for Production**

```bash
# If critical bug in production:

git checkout main
git pull origin main

# Create hotfix branch
git checkout -b hotfix/critical-security-issue

# Fix, test
git commit -m "fix(security): patch critical vulnerability"

# Push and create PR to main
git push origin hotfix/critical-security-issue

# After approval and merge to main:
# Also merge to develop to avoid regression
git checkout develop
git pull origin develop
git merge main
git push origin develop
```

---

## 📊 Verification Checklist

After all initialization steps:

```bash
# ✅ Folder structure
ls -la | grep "^d" | wc -l
# Should be 15+ directories

# ✅ Flutter
cd 04_applications/mobile_flutter
flutter doctor
# All checks ✓

# ✅ Next.js
cd 04_applications/web_nextjs
npm run build
# Should complete without errors

# ✅ NestJS
cd 05_microservices_backend/api_gateway
npm run build
# Should generate dist/ folder

# ✅ Docker
docker ps
# Should show 7 services running

# ✅ Database
docker exec domaura_postgres psql -U domaura_user -d domaura_dev -c "\dt"
# Should show tables

# ✅ Git
git log --oneline
# Should show initial commit
git branch -a
# Should show main and develop

echo "✅ All systems ready!"
```

---

## 🎯 You're Ready!

After completing all steps:

✅ Monorepo structure in place  
✅ All applications initialized  
✅ Docker infrastructure running  
✅ Git repository with branches  
✅ Team can start developing  

**Next: Assign team members to features and start the MVP sprint!** 🚀

---

## 📞 Quick Troubleshooting

### Docker won't start
```bash
docker --version  # Need 20+
docker-compose --version
docker info  # Check daemon running
```

### PostgreSQL connection error
```bash
docker logs domaura_postgres
# Check password in .env matches docker-compose.yml
```

### NestJS won't start
```bash
cd 05_microservices_backend/api_gateway
rm -rf node_modules package-lock.json
npm install
npm run start:dev
```

### Flutter issues
```bash
flutter clean
flutter pub get
flutter run
```

---

*DOMAURA v2 Initialization Guide — CTO-Grade Production Startup*
