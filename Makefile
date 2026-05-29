# Makefile for Forge Scripts

# Variables
RPC_URL ?= sepolia_testnet
DEPLOY_SCRIPT = script/DeployEx.s.sol:DeployEx
DEPLOY_EX11_SCRIPT = script/DeployEx11.s.sol:DeployEx11
SOLVE_SCRIPT = script/Solution.s.sol:Solution

# Phony targets
.PHONY: deploy deploy-ex11 solve

# Deploy contracts
deploy:
	@echo "Deploying contracts..."
	@forge script $(DEPLOY_SCRIPT) --rpc-url $(RPC_URL) --broadcast --verify --retries 3 --delay 10 -vvvv

# Redeploy only Ex11b + Ex11 against the existing ERC20TD
deploy-ex11:
	@echo "Deploying Ex11b + Ex11..."
	@forge script $(DEPLOY_EX11_SCRIPT) --rpc-url $(RPC_URL) --broadcast --verify --retries 3 --delay 10 -vvvv

# Solve exercises
solve:
	@echo "Solving exercises..."
	@forge script $(SOLVE_SCRIPT) --rpc-url $(RPC_URL) --broadcast -vvvv

# Help command
help:
	@echo "Available commands:"
	@echo "  make deploy      - Deploy all contracts"
	@echo "  make deploy-ex11 - Redeploy only Ex11b + Ex11"
	@echo "  make solve       - Solve exercises"
	@echo "  make help    - Show this help message"