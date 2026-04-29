# ============================================
# DOMAURA Makefile — Development Commands
# ============================================
# Usage: make <command>
# Example: make dev:all

.PHONY: help install dev:all dev:api dev:web dev:flutter build:all build:api build:web build:flutter test:all test:api test:web test:flutter lint:all lint:fix db:setup db:migrate db:seed docker:up docker:down docker:logs clean

# Default target
.DEFAULT_GOAL := help

# Colors
BLUE := \033[0;34m
GREEN := \033[0;32m
RED := \033[0;31m
YELLOW := \033[0;33m
NC := \033[0m # No Color

# ============================================
# HELP
# ============================================
help:
	@echo "$(BLUE)╔═══════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║         DOMAURA Make Commands            ║$(NC)"
	@echo "$(BLUE)╚═══════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "$(GREEN)Development:$(NC)"
	@echo "  make dev:all              - Start all services (API + Web + Docker)"
	@echo "  make dev:api              - Start NestJS API only"
	@echo "  make dev:web              - Start Next.js web only"
	@echo "  make dev:flutter          - Start Flutter dev"
	@echo ""
	@echo "$(GREEN)Building:$(NC)"
	@echo "  make build:all            - Build all projects"
	@echo "  make build:api            - Build NestJS API"
	@echo "  make build:web            - Build Next.js"
	@echo "  make build:flutter        - Build Flutter APK"
	@echo ""
	@echo "$(GREEN)Testing:$(NC)"
	@echo "  make test:all             - Run all tests"
	@echo "  make test:api             - Test NestJS API"
	@echo "  make test:web             - Test Next.js"
	@echo "  make test:flutter         - Test Flutter"
	@echo "  make test:coverage        - Generate coverage reports"
	@echo ""
	@echo "$(GREEN)Linting & Formatting:$(NC)"
	@echo "  make lint:all             - Lint all projects"
	@echo "  make lint:fix             - Auto-fix linting issues"
	@echo ""
	@echo "$(GREEN)Database:$(NC)"
	@echo "  make db:setup             - Setup database (migrations + seeders)"
	@echo "  make db:migrate           - Run migrations only"
	@echo "  make db:seed              - Run seeders only"
	@echo "  make db:reset             - Reset database (WARNING: data loss)"
	@echo ""
	@echo "$(GREEN)Docker:$(NC)"
	@echo "  make docker:up            - Start Docker services"
	@echo "  make docker:down          - Stop Docker services"
	@echo "  make docker:logs          - Show Docker logs"
	@echo "  make docker:build         - Build Docker images"
	@echo ""
	@echo "$(GREEN)Other:$(NC)"
	@echo "  make install              - Install all dependencies"
	@echo "  make clean                - Clean build artifacts"
	@echo ""

# ============================================
# INSTALLATION
# ============================================
install:
	@echo "$(YELLOW)Installing dependencies...$(NC)"
	@echo "Installing Backend (NestJS)..."
	@cd 05_microservices_backend && npm install
	@echo "Installing Frontend (Next.js)..."
	@cd 04_applications/web_nextjs && npm install
	@echo "$(GREEN)✓ Dependencies installed$(NC)"

# ============================================
# DEVELOPMENT
# ============================================
dev:all: docker:up dev:api dev:web
	@echo "$(GREEN)✓ All services running$(NC)"

dev:api:
	@echo "$(YELLOW)Starting NestJS API (port 3000)...$(NC)"
	@cd 05_microservices_backend && npm run start:dev

dev:web:
	@echo "$(YELLOW)Starting Next.js web (port 3001)...$(NC)"
	@cd 04_applications/web_nextjs && npm run dev

dev:flutter:
	@echo "$(YELLOW)Starting Flutter app...$(NC)"
	@cd 04_applications/mobile_flutter && flutter run

# ============================================
# BUILDING
# ============================================
build:all: build:api build:web
	@echo "$(GREEN)✓ All projects built$(NC)"

build:api:
	@echo "$(YELLOW)Building NestJS API...$(NC)"
	@cd 05_microservices_backend && npm run build

build:web:
	@echo "$(YELLOW)Building Next.js...$(NC)"
	@cd 04_applications/web_nextjs && npm run build

build:flutter:
	@echo "$(YELLOW)Building Flutter APK...$(NC)"
	@cd 04_applications/mobile_flutter && flutter build apk

build:flutter:ios:
	@echo "$(YELLOW)Building Flutter iOS...$(NC)"
	@cd 04_applications/mobile_flutter && flutter build ios

# ============================================
# TESTING
# ============================================
test:all: test:api test:web test:flutter
	@echo "$(GREEN)✓ All tests completed$(NC)"

test:api:
	@echo "$(YELLOW)Testing NestJS API...$(NC)"
	@cd 05_microservices_backend && npm run test

test:web:
	@echo "$(YELLOW)Testing Next.js...$(NC)"
	@cd 04_applications/web_nextjs && npm run test

test:flutter:
	@echo "$(YELLOW)Testing Flutter...$(NC)"
	@cd 04_applications/mobile_flutter && flutter test

test:coverage:
	@echo "$(YELLOW)Generating coverage reports...$(NC)"
	@cd 05_microservices_backend && npm run test:cov
	@cd 04_applications/web_nextjs && npm run test:coverage
	@echo "$(GREEN)✓ Coverage reports generated$(NC)"

# ============================================
# LINTING & FORMATTING
# ============================================
lint:all: lint:api lint:web
	@echo "$(GREEN)✓ All linting checks completed$(NC)"

lint:api:
	@echo "$(YELLOW)Linting NestJS API...$(NC)"
	@cd 05_microservices_backend && npm run lint

lint:web:
	@echo "$(YELLOW)Linting Next.js...$(NC)"
	@cd 04_applications/web_nextjs && npm run lint

lint:fix:
	@echo "$(YELLOW)Fixing code formatting...$(NC)"
	@cd 05_microservices_backend && npm run lint:fix
	@cd 04_applications/web_nextjs && npm run lint:fix
	@echo "$(GREEN)✓ Formatting fixed$(NC)"

# ============================================
# DATABASE
# ============================================
db:setup: db:migrate db:seed
	@echo "$(GREEN)✓ Database initialized$(NC)"

db:migrate:
	@echo "$(YELLOW)Running database migrations...$(NC)"
	@cd 05_microservices_backend && npm run typeorm migration:run

db:seed:
	@echo "$(YELLOW)Running seeders...$(NC)"
	@cd 05_microservices_backend && npm run seed

db:reset:
	@echo "$(RED)⚠️  WARNING: This will delete all data!$(NC)"
	@read -p "Are you sure? (y/N) " -n 1 -r; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		cd 05_microservices_backend && npm run typeorm schema:drop && npm run db:migrate && npm run db:seed; \
		echo "$(GREEN)✓ Database reset$(NC)"; \
	else \
		echo "$(YELLOW)Cancelled$(NC)"; \
	fi

# ============================================
# DOCKER
# ============================================
docker:up:
	@echo "$(YELLOW)Starting Docker services...$(NC)"
	docker-compose up -d
	@echo "$(GREEN)✓ Docker services started$(NC)"
	@echo "Services:"
	@echo "  - PostgreSQL: localhost:5432"
	@echo "  - Redis: localhost:6379"
	@echo "  - PgAdmin: http://localhost:5050"
	@echo "  - Redis Commander: http://localhost:8081"
	@echo "  - Prometheus: http://localhost:9090"
	@echo "  - Grafana: http://localhost:3002"

docker:down:
	@echo "$(YELLOW)Stopping Docker services...$(NC)"
	docker-compose down
	@echo "$(GREEN)✓ Docker services stopped$(NC)"

docker:logs:
	@docker-compose logs -f

docker:build:
	@echo "$(YELLOW)Building Docker images...$(NC)"
	docker-compose build
	@echo "$(GREEN)✓ Docker images built$(NC)"

docker:clean:
	@echo "$(YELLOW)Cleaning Docker resources...$(NC)"
	docker-compose down -v
	@echo "$(GREEN)✓ Docker resources cleaned$(NC)"

# ============================================
# GIT OPERATIONS
# ============================================
git:feature:
	@read -p "Feature name: " feature; \
	git checkout -b feature/$$feature
	@echo "$(GREEN)✓ Feature branch created$(NC)"

git:bugfix:
	@read -p "Bug name: " bug; \
	git checkout -b bugfix/$$bug
	@echo "$(GREEN)✓ Bugfix branch created$(NC)"

git:sync:
	@echo "$(YELLOW)Syncing with develop...$(NC)"
	git fetch origin
	git rebase origin/develop
	@echo "$(GREEN)✓ Synced$(NC)"

# ============================================
# UTILITIES
# ============================================
clean:
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	@cd 05_microservices_backend && rm -rf dist node_modules
	@cd 04_applications/web_nextjs && rm -rf .next node_modules
	@cd 04_applications/mobile_flutter && rm -rf build .dart_tool
	@echo "$(GREEN)✓ Cleaned$(NC)"

install:all: install
	@echo "$(GREEN)✓ All dependencies installed$(NC)"

check:
	@echo "$(YELLOW)Running checks...$(NC)"
	@echo "Checking Node.js..."
	@which node > /dev/null && echo "$(GREEN)✓ Node.js installed$(NC)" || echo "$(RED)✗ Node.js not found$(NC)"
	@echo "Checking Docker..."
	@which docker > /dev/null && echo "$(GREEN)✓ Docker installed$(NC)" || echo "$(RED)✗ Docker not found$(NC)"
	@echo "Checking Flutter..."
	@which flutter > /dev/null && echo "$(GREEN)✓ Flutter installed$(NC)" || echo "$(RED)✗ Flutter not found$(NC)"

# ============================================
# PRODUCTION
# ============================================
deploy:prod:
	@echo "$(RED)⚠️  Deploying to production...$(NC)"
	@echo "$(YELLOW)Building projects...$(NC)"
	@make build:all
	@echo "$(YELLOW)Running tests...$(NC)"
	@make test:all
	@echo "$(GREEN)✓ Ready for deployment$(NC)"
	@echo "Next steps: Push to main branch and trigger CI/CD pipeline"

# ============================================
# ENV SETUP
# ============================================
setup:env:
	@if [ ! -f .env ]; then \
		echo "$(YELLOW)Creating .env file...$(NC)"; \
		cp .env.example .env; \
		echo "$(GREEN)✓ .env created - Please update with your values$(NC)"; \
	else \
		echo "$(YELLOW).env already exists$(NC)"; \
	fi
