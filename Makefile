-include .env

build:
	forge build

deploy-sepholia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPHOLIA) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvv
