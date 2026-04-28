# ⚡ QUICK EXECUTION COMMANDS

Copy-paste these directly into your terminal.

---

## 🔧 VERIFY STRUCTURE IS COMPLETE

```powershell
cd c:\Users\Austin\Desktop\Domaura_V1_0
Get-ChildItem -Directory | Where-Object {$_.Name -match "^[0-9]{2}_"} | ForEach-Object {$_.Name}
```

Should show 16 directories: `00_gouvernance_projet` through `15_recherche_rnd`

---

## 📱 STEP 1: FLUTTER SETUP (Run once)

```bash
cd c:\Users\Austin\Desktop\Domaura_V1_0\04_applications
flutter create mobile_flutter --project-name domaura --org com.domaura
cd mobile_flutter
flutter pub get
flutter doctor
# Check all items are ✓ green
```

---

## 🌐 STEP 2: NEXTJS SETUP (Run once)

```bash
cd c:\Users\Austin\Desktop\Domaura_V1_0\04_applications
npx create-next-app@latest web_nextjs \
  --typescript \
  --tailwind \
  --app \
  --eslint \
  --git false
cd web_nextjs
npm install
```

---

## 🔌 STEP 3: NESTJS SETUP (Run once)

```bash
cd c:\Users\Austin\Desktop\Domaura_V1_0\05_microservices_backend\api_gateway
npx @nestjs/cli@latest new . --skip-git --package-manager npm
npm install
```

---

## 🗄️ STEP 4: DOCKER + DATABASE (Run once)

```bash
# From project root
cd c:\Users\Austin\Desktop\Domaura_V1_0

# Copy environment file
cp .env.example .env

# Start Docker
docker-compose up -d

# Wait for PostgreSQL to be healthy (10 seconds)
# Then run migrations
cd 05_microservices_backend\api_gateway
npm run typeorm migration:run
```

---

## 🚀 STEP 5: GIT INITIALIZATION (Run once)

```bash
# From project root
cd c:\Users\Austin\Desktop\Domaura_V1_0

# Initialize Git
git init

# Create initial commit
git add .
git commit -m "feat: initial domaura v2 monorepo architecture"

# Create develop branch
git branch develop
git checkout develop

# Add remote (replace YOUR_ORG)
git remote add origin https://github.com/YOUR_ORG/domaura.git

# Push all branches
git push -u origin main develop
```

---

## 🎯 DAILY DEVELOPMENT COMMANDS

### Start everything
```bash
make dev:all
# or manually:
cd 04_applications/mobile_flutter && flutter run &
cd ../web_nextjs && npm run dev &
cd ../../05_microservices_backend/api_gateway && npm run start:dev
```

### Create new feature
```bash
git checkout develop
git pull origin develop
git checkout -b feature/my-feature-name
# ... make changes ...
git add .
git commit -m "feat(scope): description"
git push origin feature/my-feature-name
# Then create PR on GitHub
```

### Run tests
```bash
make test:all
```

### Format code
```bash
make lint:fix
```

### Stop everything
```bash
docker-compose down
# Kill any running processes with Ctrl+C
```

---

## ✅ VERIFICATION CHECKLIST

After each step, verify:

```bash
# After Step 1: Flutter
flutter doctor

# After Step 2: Next.js
npm run build

# After Step 3: NestJS
npm run build

# After Step 4: Docker
docker ps
# Should show 8 services running

# After Step 5: Git
git log --oneline
git branch -a
```

---

## 🚨 TROUBLESHOOTING

### Flutter won't run
```bash
flutter clean
flutter pub get
flutter run
```

### Node dependencies issue
```bash
rm -rf node_modules package-lock.json
npm install
```

### Docker won't start
```bash
docker --version  # Need 20+
docker-compose --version
docker-compose up -d
```

### PostgreSQL connection error
```bash
# Check password in .env matches docker-compose.yml
docker logs domaura_postgres
```

---

*Quick execution guide for DOMAURA v2*
