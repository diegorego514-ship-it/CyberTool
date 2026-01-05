# =========================
# Project Variables
# =========================
PYTHON      := python3
APP_NAME    := cybertool
MAIN_FILE  := cybertool.py
VENV_DIR   := venv
REQ_FILE   := requirements.txt

# =========================
# Default Target
# =========================
.PHONY: all
all: run

# =========================
# Run the Application
# =========================
.PHONY: run
run:
		@echo "▶ Running $(APP_NAME)..."
		$(PYTHON) $(MAIN_FILE)

# =========================
# Create Virtual Environment
# =========================
.PHONY: venv
venv:
		@echo "▶ Creating virtual environment..."
		$(PYTHON) -m venv $(VENV_DIR)

# =========================
# Install Dependencies
# =========================
.PHONY: install
install:
		@echo "▶ Installing dependencies..."
		$(VENV_DIR)/bin/pip install -r $(REQ_FILE)

# =========================
# Freeze Dependencies
# =========================
.PHONY: freeze
freeze:
		@echo "▶ Saving dependencies..."
		pip freeze > $(REQ_FILE)

# =========================
# Clean Generated Files
# =========================
.PHONY: clean
clean:
		@echo "▶ Cleaning project..."
		rm -rf __pycache__ *.pyc $(VENV_DIR)

# =========================
# Help Menu
# =========================
.PHONY: help
help:
		@echo ""
		@echo "📌 Available Commands:"
		@echo " make run     → Run the tool"
		@echo " make venv    → Create virtual environment"
		@echo " make install → Install dependencies"
		@echo " make freeze  → Save dependencies"
		@echo " make clean   → Clean project files"
		@echo ""