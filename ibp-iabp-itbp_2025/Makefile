# -------------------------------------------------------------------
# Makefile for local and remote execution with process management
# -------------------------------------------------------------------

SHELL := /bin/bash

.PHONY: create_files run_sequential run_parallel data status kill clean help

USER_NAME := $(shell whoami)
STAMP_FILE := .generated_files_stamp
MAIN_PATH_FILE := .main_exec_path

# -------------------------------------------------------------------
# Helper: detect main executable and persist its absolute path
# Called as: $(call detect_main_exec)
define detect_main_exec
	@if [ -f $(MAIN_PATH_FILE) ] && [ -s $(MAIN_PATH_FILE) ]; then \
		:; \
	else \
		if [ -f command.txt ] && [ -s command.txt ]; then \
			CMD=$$(head -n1 command.txt); \
			BIN=$$(printf "%s\n" "$$CMD" | awk '{print $$1}'); \
			if [ -n "$$BIN" ]; then \
				if [ -x "$$BIN" ]; then \
					ABS=$$(realpath "$$BIN" 2>/dev/null || echo "$$BIN"); \
					echo "$$ABS" > $(MAIN_PATH_FILE); \
				elif command -v "$$BIN" >/dev/null 2>&1; then \
					command -v "$$BIN" > $(MAIN_PATH_FILE); \
				fi; \
			fi; \
		fi; \
		if [ ! -f $(MAIN_PATH_FILE) ] || [ ! -s $(MAIN_PATH_FILE) ]; then \
			if [ -x "./build/bin/main" ]; then \
				realpath ./build/bin/main > $(MAIN_PATH_FILE); \
			fi; \
		fi; \
	fi; \
	if [ ! -f $(MAIN_PATH_FILE) ] || [ ! -s $(MAIN_PATH_FILE) ]; then \
		printf "\033[1;31m[ERROR]\033[0m Could not detect main executable.\n" ; \
		printf "       Create \033[1m%s\033[0m with the absolute path or ensure the first line of \033[1mcommand.txt\033[0m starts with the binary.\n" "$(MAIN_PATH_FILE)"; \
		exit 1; \
	else \
		printf "\033[1;34m[INFO]\033[0m Using main executable: %s\n" "$$(cat $(MAIN_PATH_FILE))"; \
	fi
endef

# -------------------------------------------------------------------
# Generate input files and command list (only if not already created)
create_files:
	@if [ -f $(STAMP_FILE) ]; then \
		printf "\033[1;34m[INFO]\033[0m Input files already exist. Skipping creation.\n"; \
	else \
		printf "\033[1;34m[INFO]\033[0m Generating input files and commands...\n"; \
		if [ ! -x ./create_input_files.sh ] || [ ! -x ./create_run_commands.sh ]; then \
			printf "\033[1;31m[ERROR]\033[0m Missing or non-executable scripts: create_input_files.sh and/or create_run_commands.sh\n"; \
			exit 1; \
		fi; \
		./create_input_files.sh && ./create_run_commands.sh; \
		touch $(STAMP_FILE); \
		printf "\033[1;34m[INFO]\033[0m Files successfully created.\n"; \
	fi

# -------------------------------------------------------------------
# Run commands from 'command.txt' sequentially in the terminal
run_sequential: create_files
	$(call detect_main_exec)
	@if [ ! -f command.txt ] || [ ! -s command.txt ]; then \
		printf "\033[1;31m[ERROR]\033[0m 'command.txt' not found or empty. Run 'make create_files' first.\n"; \
		exit 1; \
	fi
	@printf "\033[1;34m[INFO]\033[0m Starting sequential execution of commands from 'command.txt'...\n"
	@mkdir -p logs
	@bash -c 'counter=1; while IFS= read -r cmd; do \
		if [ -n "$$cmd" ]; then \
			printf "\033[1;33m>> Running command #$$counter: %s\033[0m\n" "$$cmd"; \
			eval "$$cmd" > logs/command_$$counter.log 2>&1; \
			rc=$$?; \
			printf "\033[1;34m[INFO]\033[0m Output saved to logs/command_$$counter.log (rc=%d)\n" "$$rc"; \
			counter=$$((counter + 1)); \
		fi; \
	done < command.txt'
	@printf "\033[1;34m[INFO]\033[0m Sequential execution completed.\n"

# -------------------------------------------------------------------
# Run run_parallel.sh using nohup (server mode / background)
run_parallel: create_files
	$(call detect_main_exec)
	@if [ ! -x ./run_parallel.sh ]; then \
		printf "\033[1;31m[ERROR]\033[0m Missing or non-executable script: run_parallel.sh\n"; \
		exit 1; \
	fi
	@printf "\033[1;34m[INFO]\033[0m Starting background execution with nohup...\n"
	@mkdir -p logs
	@nohup ./run_parallel.sh > logs/nohup_master.log 2>&1 & echo $$! > run.pid
	@printf "\033[1;34m[INFO]\033[0m Main log: logs/nohup_master.log\n"
	@printf "\033[1;34m[INFO]\033[0m PID saved to: run.pid\n"

# -------------------------------------------------------------------
# Execute the collect_data.sh script to collect results
data:
	@printf "\033[1;34m[INFO]\033[0m Collecting data...\n"
	@if [ ! -x ./collect_data.sh ]; then \
		printf "\033[1;31m[ERROR]\033[0m Missing or non-executable script: collect_data.sh\n"; \
		exit 1; \
	fi
	@./collect_data.sh
	@printf "\033[1;34m[INFO]\033[0m Data collection completed.\n"

# -------------------------------------------------------------------
# Check if the process saved in run.pid is still running
status:
	@PID=$$(cat run.pid 2>/dev/null || echo ""); \
	if [ -z "$$PID" ]; then \
		printf "\033[1;33m[WARN]\033[0m File 'run.pid' not found.\n"; \
	elif ps -p $$PID > /dev/null; then \
		printf "\033[1;34m[INFO]\033[0m Process $$PID is still running.\n"; \
	else \
		printf "\033[1;34m[INFO]\033[0m Process $$PID has already finished.\n"; \
	fi

# -------------------------------------------------------------------
# Kill all processes running the main executable for this user
kill:
	$(call detect_main_exec)
	@if [ -f $(MAIN_PATH_FILE) ]; then \
		MAIN_EXECUTABLE=$$(cat $(MAIN_PATH_FILE)); \
		printf "\033[1;34m[INFO]\033[0m Terminating all '$$MAIN_EXECUTABLE' processes for user $(USER_NAME)...\n"; \
		MATCH=$$(basename $$MAIN_EXECUTABLE); \
		pgrep -u $(USER_NAME) -f "$$MATCH" | tee /tmp/pids_to_kill.txt > /dev/null; \
		if [ -s /tmp/pids_to_kill.txt ]; then \
			xargs -a /tmp/pids_to_kill.txt kill -9; \
			printf "\033[1;34m[INFO]\033[0m Killed $$(wc -l < /tmp/pids_to_kill.txt) processes.\n"; \
		else \
			printf "\033[1;33m[WARN]\033[0m No matching processes found.\n"; \
		fi; \
		rm -f /tmp/pids_to_kill.txt; \
	else \
		printf "\033[1;31m[ERROR]\033[0m .main_exec_path not found. Run create_files first.\n"; \
	fi
	-@kill -TERM $$(cat run.pid 2>/dev/null) 2>/dev/null || true
	@rm -f run.pid
	@printf "\033[1;34m[INFO]\033[0m Processes terminated.\n"

# -------------------------------------------------------------------
# Clean generated files and logs, and remove the stamp
clean:
	@printf "\033[1;34m[INFO]\033[0m Cleaning temporary files and outputs...\n"
	@rm -rf logs run.pid input results run_parallel.pid command.txt results.txt $(STAMP_FILE) $(MAIN_PATH_FILE)
	@printf "\033[1;34m[INFO]\033[0m Cleanup completed.\n"

# -------------------------------------------------------------------
# Display help message
help:
	@echo "-------------------------------------------------------"
	@echo "Makefile usage:"
	@echo ""
	@echo "make create_files     # Generate input files and command list (only if missing)"
	@echo "make run_sequential   # Run commands sequentially (with logs)"
	@echo "make run_parallel     # Run run_parallel.sh with nohup (background/server)"
	@echo "make data             # Execute script to collect data"
	@echo "make status           # Check if the background process is running"
	@echo "make kill             # Kill processes running the detected main executable"
	@echo "make clean            # Remove temporary files, logs, and generation stamp"
	@echo "make help             # Show this help message"
	@echo "-------------------------------------------------------"

