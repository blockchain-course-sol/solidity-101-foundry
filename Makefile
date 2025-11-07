# Makefile for Forge Scripts

# Variables
RPC_URL ?= sepolia_testnet
DEPLOY_SCRIPT = script/DeployEx.s.sol:DeployEx
SOLVE_SCRIPT = script/Solution.s.sol:Solution

# Phony targets
.PHONY: deploy solve

# Deploy contracts
deploy:
	@echo "Deploying contracts..."
	@forge script $(DEPLOY_SCRIPT) --rpc-url $(RPC_URL) --broadcast --verify --retries 3 --delay 10 -vvvv

# Solve exercises
solve:
	@echo "Solving exercises..."
	@forge script $(SOLVE_SCRIPT) --rpc-url $(RPC_URL) --broadcast -vvvv

# Help command
help:
	@echo "Available commands:"
	@echo "  make deploy  - Deploy contracts"
	@echo "  make solve   - Solve exercises"
	@echo "  make help    - Show this help message"