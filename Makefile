# Makefile for Forge Scripts

# Variables
RPC_URL ?= bsc_testnet
DEPLOY_SCRIPT = script/DeployEx.s.sol:DeployEx
SOLVE_SCRIPT = script/Solution.s.sol:Solution

# Phony targets
.PHONY: deploy solve

# Deploy contracts
deploy:
	@echo "Deploying contracts..."
	@forge script $(DEPLOY_SCRIPT) --rpc-url $(RPC_URL) --broadcast --verify -vvvv

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