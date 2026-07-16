.PHONY: setup start up down build logs shell-backend shell-db clean urls

setup:
	chmod +x setup.sh && ./setup.sh

# Start in background and print a summary of service URLs
start:
	docker compose up -d
	@echo ""
	@echo "┌─────────────────────────────────────────────┐"
	@echo "│          UBCMA Dev Environment              │"
	@echo "├─────────────────────────────────────────────┤"
	@echo "│  mp-frontend  →  http://localhost:3000       │"
	@echo "│  mp-backend   →  http://localhost:8080       │"
	@echo "│  ma-site      →  http://localhost:3001       │"
	@echo "│  ma-network   →  http://localhost:3002       │"
	@echo "├─────────────────────────────────────────────┤"
	@echo "│  make logs     tail all service output      │"
	@echo "│  make down     stop everything              │"
	@echo "└─────────────────────────────────────────────┘"
	@echo ""

# Start in foreground (shows all logs — useful for debugging)
up:
	docker compose up

down:
	docker compose down

build:
	docker compose build

logs:
	docker compose logs -f

shell-backend:
	docker compose exec mp-backend sh

shell-db:
	docker compose exec postgres psql -U $${POSTGRES_USER:-ubcma} -d $${POSTGRES_DB:-ubcma_dev}

urls:
	@echo ""
	@echo "┌─────────────────────────────────────────────┐"
	@echo "│          UBCMA Dev Environment              │"
	@echo "├─────────────────────────────────────────────┤"
	@echo "│  mp-frontend  →  http://localhost:3000       │"
	@echo "│  mp-backend   →  http://localhost:8080       │"
	@echo "│  ma-site      →  http://localhost:3001       │"
	@echo "│  ma-network   →  http://localhost:3002       │"
	@echo "└─────────────────────────────────────────────┘"
	@echo ""

# Tears down containers AND deletes named volumes (postgres + redis data)
clean:
	docker compose down -v --remove-orphans
