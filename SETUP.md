# 🚀 SETUP & INITIALIZATION GUIDE — DOMAURA

**Complete guide to initialize your DOMAURA development environment**

---

## 📋 Prerequisites

Before starting, ensure you have installed:

- **Node.js** 18+ → https://nodejs.org
- **Flutter SDK** 3.x → https://flutter.dev/docs/get-started/install
- **Docker** & **Docker Compose** → https://www.docker.com/products/docker-desktop
- **Git** → https://git-scm.com
- **PostgreSQL** 15+ (or use Docker)
- **Redis** 7+ (or use Docker)

### Verify Installation

```bash
node --version        # v18.x.x or higher
flutter --version     # Flutter 3.x.x
docker --version      # Docker version
docker-compose --version  # Docker Compose version
git --version         # git version
```

---

## 🎯 Recommended Initialization Order

### **Step 1: Environment Setup (5 min)**

```bash
# Clone repository
git clone https://github.com/domaura/domaura.git
cd DOMAURA

# Create .env file from template
cp .env.example .env

# Edit .env with your settings (API keys, DB credentials, etc.)
# Important: Generate strong passwords for PRODUCTION
nano .env  # or your preferred editor
```

### **Step 2: Docker Infrastructure (10 min)**

```bash
# Start Docker services (PostgreSQL, Redis, Admin UIs)
make docker:up

# Verify services are running
docker ps

# You should see:
# - postgres (port 5432)
# - redis (port 6379)
# - pgadmin (port 5050)
# - redis-commander (port 8081)
# - prometheus (port 9090)
# - grafana (port 3002)
```

**Access Admin UIs:**
- **PgAdmin** (PostgreSQL): http://localhost:5050
- **Redis Commander**: http://localhost:8081
- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3002

### **Step 3: Database Initialization (5 min)**

```bash
# Wait for PostgreSQL to be ready (health check)
# Then run migrations and seeders

make db:setup

# This will:
# 1. Run migrations
# 2. Run seeders (test data)
# 3. Setup initial schema
```

**Verify Database:**
- Go to http://localhost:5050 (PgAdmin)
- Login with: admin@example.com / admin
- Connect to postgres server
- Check tables in `domaura_dev` database

### **Step 4: Backend (NestJS) — Port 3000**

#### Installation

```bash
# Install backend dependencies
cd 05_backend_services
npm install

# Verify installation
npm list | head -20
```

#### Configuration

```bash
# Already copied from .env.example in Step 1
# No additional config needed
```

#### Start Development

```bash
# From project root
make dev:api

# OR manual command
cd 05_backend_services
npm run start:dev
```

**Expected output:**
```
[Nest] 12345  - 04/28/2026, 10:30:00 AM     LOG [NestFactory] Starting Nest application...
[Nest] 12345  - 04/28/2026, 10:30:00 AM     LOG [InstanceLoader] AppModule dependencies initialized +123ms
[Nest] 12345  - 04/28/2026, 10:30:00 AM     LOG [RoutesResolver] AppController {/api}:
[Nest] 12345  - 04/28/2026, 10:30:01 AM     LOG [NestApplication] Nest application successfully started
```

**Verify Backend:**
```bash
# In new terminal
curl http://localhost:3000/api/health
# Expected: { "status": "ok" }
```

**API Documentation:**
- Swagger UI: http://localhost:3000/api/docs
- API endpoints start at: http://localhost:3000/api

### **Step 5: Frontend Web (Next.js) — Port 3001**

#### Installation

```bash
# Install frontend dependencies
cd 04_applications/web_nextjs
npm install

# Verify installation
npm list | head -20
```

#### Start Development

```bash
# From project root
make dev:web

# OR manual command
cd 04_applications/web_nextjs
npm run dev
```

**Expected output:**
```
  ▲ Next.js 14.0.0
  - Local:        http://localhost:3000
  - Environments: .env.local

  ✓ Ready in 1234ms
```

**Verify Frontend:**
- Open http://localhost:3001 in browser
- Should see landing page / dashboard

#### Environment for Web

```bash
# 04_applications/web_nextjs/.env.local
NEXT_PUBLIC_API_URL=http://localhost:3000/api
NEXT_PUBLIC_APP_URL=http://localhost:3001
FIREBASE_API_KEY=your_key_here
# ... other keys
```

### **Step 6: Mobile (Flutter) — Optional**

#### Installation

```bash
cd 04_applications/mobile_flutter

# Get dependencies
flutter pub get

# Verify installation
flutter doctor  # Should show all green ✓
```

#### Start Development

**Option A: Android Emulator**
```bash
# Start Android emulator first, then:
make dev:flutter

# OR manual
flutter run
```

**Option B: Physical Device**
```bash
# Enable USB debugging on device, then:
flutter run
```

**Option C: Web (testing)**
```bash
flutter run -d chrome
# Opens at http://localhost:54321
```

---

## 🔄 Full Stack Development (Parallel)

To run everything simultaneously in development:

### Terminal 1: Docker Infrastructure
```bash
make docker:up
# Keep running for duration of development
```

### Terminal 2: Database
```bash
make db:setup
# Runs once, then done
```

### Terminal 3: Backend API
```bash
make dev:api
# Keep running - watches for changes
```

### Terminal 4: Frontend Web
```bash
make dev:web
# Keep running - watches for changes
```

### Terminal 5: Mobile (optional)
```bash
make dev:flutter
# Keep running - watches for changes
```

---

## ✅ Verification Checklist

After all steps, verify everything works:

```bash
# Backend health check
curl http://localhost:3000/api/health
# Expected: { "status": "ok" }

# Database connection (via PgAdmin)
# Visit http://localhost:5050
# Should connect successfully

# Redis check (via Redis Commander)
# Visit http://localhost:8081
# Should show Redis info

# Frontend loads
# Visit http://localhost:3001
# Should show landing page

# API Docs available
# Visit http://localhost:3000/api/docs
# Should show Swagger UI
```

---

## 🧪 Testing the Stack

```bash
# Backend tests
make test:api

# Frontend tests
make test:web

# Flutter tests
make test:flutter

# All tests
make test:all

# With coverage
make test:coverage
```

---

## 📊 Monitoring & Admin

**Services Dashboard:**
| Service | Port | URL |
|---------|------|-----|
| **Backend API** | 3000 | http://localhost:3000 |
| **API Docs** | 3000 | http://localhost:3000/api/docs |
| **Frontend Web** | 3001 | http://localhost:3001 |
| **PgAdmin** | 5050 | http://localhost:5050 |
| **Redis Commander** | 8081 | http://localhost:8081 |
| **Prometheus** | 9090 | http://localhost:9090 |
| **Grafana** | 3002 | http://localhost:3002 |

---

## 🐛 Troubleshooting

### PostgreSQL Connection Failed

```bash
# Check if postgres is running
docker ps | grep postgres

# If not running
make docker:up

# Check logs
docker logs domaura_postgres

# Verify credentials in .env match docker-compose.yml
```

### Redis Connection Failed

```bash
# Verify Redis is running
docker ps | grep redis

# Check Redis password
docker logs domaura_redis

# Test connection
redis-cli -h localhost -p 6379 ping
```

### Backend Won't Start

```bash
# Clear node_modules
rm -rf 05_backend_services/node_modules

# Reinstall
cd 05_backend_services && npm install

# Try again
npm run start:dev

# Check logs for errors
```

### Frontend Won't Start

```bash
# Clear cache
rm -rf 04_applications/web_nextjs/.next

# Clear node_modules
rm -rf 04_applications/web_nextjs/node_modules

# Reinstall
cd 04_applications/web_nextjs && npm install

# Try again
npm run dev
```

### Database Migrations Failed

```bash
# Check migration status
cd 05_backend_services
npm run typeorm migration:show

# Revert last migration
npm run typeorm migration:revert

# Try setup again
make db:setup
```

---

## 🔑 Common Commands

```bash
# Development
make dev:all          # Start all services
make dev:api          # Start backend only
make dev:web          # Start frontend only
make dev:flutter      # Start mobile only

# Docker
make docker:up        # Start infrastructure
make docker:down      # Stop infrastructure
make docker:logs      # Show logs

# Database
make db:setup         # Initialize database
make db:migrate       # Run migrations
make db:seed          # Run seeders
make db:reset         # Reset database (careful!)

# Testing
make test:all         # Run all tests
make test:api         # Test backend
make test:web         # Test frontend
make test:flutter     # Test mobile

# Building
make build:all        # Build all projects
make build:api        # Build backend
make build:web        # Build frontend
make build:flutter    # Build Flutter APK

# Code Quality
make lint:all         # Check linting
make lint:fix         # Fix formatting

# Help
make help             # Show all commands
```

---

## 🎓 Next Steps After Setup

1. **Read the Contributing Guide** → [CONTRIBUTING.md](../CONTRIBUTING.md)
2. **Check the Architecture Docs** → `02_architecture_logicielle/`
3. **Review User Stories** → `01_documentation/user_stories/`
4. **Start with Small Features** → Pick from backlog
5. **Join Team Communication** → Slack/Discord channels

---

## 📞 Getting Help

- **Setup Issues** → Check Troubleshooting section above
- **Architecture Questions** → See `02_architecture_logicielle/`
- **Feature Questions** → See `01_documentation/`
- **Code Style** → See [CONTRIBUTING.md](../CONTRIBUTING.md#conventions-de-code)
- **Team Help** → Slack #dev channel or hello@domaura.com

---

## 🚀 You're Ready!

Once setup is complete, you have a fully functional development environment with:

✅ PostgreSQL database with migrations  
✅ Redis cache & event broker  
✅ NestJS API with authentication  
✅ Next.js frontend with SSR  
✅ Flutter mobile app  
✅ Monitoring & admin dashboards  
✅ Testing framework  
✅ CI/CD ready  

**Start coding! The team awaits your contributions.** 💪

---

*Last updated: April 2026*
