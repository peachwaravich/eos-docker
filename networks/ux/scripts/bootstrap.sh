#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CONTAINER="ux-main"
WALLETNAME="development"
DATADIR="data"

echo $CONTAINER

########### Create wallet

if [ `docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet list |grep $WALLETNAME|wc -l` -lt 1 ]
then
  echo "Create development wallet"
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet create -n $WALLETNAME -f /ux-data/walletpw.txt

  echo "Unlock development wallet"
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet open -n $WALLETNAME
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet unlock -n $WALLETNAME --password $(cat ${DIR}/../$DATADIR/walletpw.txt)

  echo "Import development keys to wallet"
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet import -n $WALLETNAME --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet import -n $WALLETNAME --private-key 5JUzsJi7rARZy2rT5eHhcdUKTyVPvaksnEKtNWzyiBbifJA1dUW
else
  echo "Unlock development wallet"
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet open -n $WALLETNAME
  docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 wallet unlock -n $WALLETNAME --password $(cat ${DIR}/../$DATADIR/walletpw.txt)
fi

########### // 


########### Create blockchain accounts
echo "Create eosio.token user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.bpay user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.bpay EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.upay user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.upay EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.names user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.names EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.ram user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.ram EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.ramfee user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.ramfee EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.saving user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.saving EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.stake user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.stake EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.rex user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.rex EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.info user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.info EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.proof user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.proof EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Create eosio.freeze user"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 create account eosio eosio.freeze EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

########### // 


########### Clone / build / deploy process

bash $DIR/uxprotocol-deploy.sh clone build deploy

########### // 


########### General Chain Deployment & Testing

# echo ""
# echo "Creating UTX / UTXRAM Tokens"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token create '[ "eosio", "2500000000.0000 UTX"]' -p eosio.token@active
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token create '[ "eosio", "9437184.0000 UTXRAM"]' -p eosio.token@active

# echo ""
# echo "Issuing UTX Token to eosio"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "180000000.0000 UTX", "eosio" ]' -p eosio@active

# echo ""
# echo "Issuing UTXRAM to eosio"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "1048576.0000 UTXRAM", "eosio" ]' -p eosio@active

# echo ""
# echo "Init eosio.system Contract"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio init '[0, "4,UTX"]' -p eosio@active

# echo ""
# echo "Setting global params"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio setparams '{"params":{"max_block_net_usage": 1048576, "target_block_net_usage_pct": 1000, "max_transaction_net_usage": 524288, "base_per_transaction_net_usage": 12, "net_usage_leeway": 500, "context_free_discount_net_usage_num": 20, "context_free_discount_net_usage_den": 100, "max_block_cpu_usage": 1500000, "target_block_cpu_usage_pct": 1000, "max_transaction_cpu_usage": 1450000, "min_transaction_cpu_usage": 100, "max_transaction_lifetime": 3600, "deferred_trx_expiration_window": 600, "max_transaction_delay": 3888000, "max_inline_action_size": 4096, "max_inline_action_depth": 6, "max_authority_depth": 6}}' -p eosio@active

# echo ""
# echo "Creating testuser1 account"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio testuser1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "1.0000 UTX" --stake-cpu "1.0000 UTX" --buy-ram "4.0000 UTXRAM" --transfer

# echo ""
# echo "Creating testuser2 account"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio testuser2 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "1.0000 UTX" --stake-cpu "1.0000 UTX" --buy-ram "4.0000 UTXRAM" --transfer

# echo ""
# echo "Buy ram for testuser1 invalid increment (should fail)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system buyram eosio testuser1 "8.2530 UTXRAM"

# echo ""
# echo "Buy ram for testuser1"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system buyram eosio testuser1 "8.0000 UTXRAM"

# echo ""
# echo "Buy ram for testuser2 invalid increment (should fail)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system buyram eosio testuser2 3000 --bytes

# echo ""
# echo "Buy ram for testuser2"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system buyram eosio testuser2 2 --kbytes

# echo ""
# echo "Sell ram for testuser2 invalid increment (should fail)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system sellram testuser2 2000

# echo ""
# echo "Sell ram for testuser2"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system sellram testuser1 1024

# echo ""
# echo "Transfering tokens to testuser1"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token transfer '["eosio", "testuser1", "160000000.0000 UTX",  ""]' -p eosio@active

# echo ""
# echo "Transfering tokens to testuser2"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token transfer '["eosio", "testuser2", "11000000.0000 UTX",  ""]' -p eosio@active

# echo ""
# echo "attempt to register without sufficient stake (should fail)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio regproducer '["testuser1", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "https://eostitan.com", 124]' -p testuser1@active

# echo ""
# echo "stake 10 million tokens"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio delegatebw '{"from":"testuser1", "receiver":"testuser1", "stake_net_quantity":"5000000.0000 UTX", "stake_cpu_quantity":"5000000.0000 UTX", "transfer":0}' -p testuser1@active

# echo ""
# echo "register with sufficient stake (should work)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio regproducer '["testuser1", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "https://eostitan.com", 124]' -p testuser1@active

# echo ""
# echo "stake 140 million tokens (required for network activation)" 
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio delegatebw '{"from":"testuser1", "receiver":"testuser1", "stake_net_quantity":"70000000.0000 UTX", "stake_cpu_quantity":"70000000.0000 UTX", "transfer":0}' -p testuser1@active

# echo ""
# echo "vote producer"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio voteproducer '{"voter":"testuser1", "proxy":"", "producers":["testuser1"]}' -p testuser1@active

# echo ""
# echo "attempt to unstake without unregproducer (should fail)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose push action eosio undelegatebw '{"from":"testuser1", "receiver":"testuser1", "unstake_net_quantity":"75000000.0000 UTX", "unstake_cpu_quantity":"74000000.0000 UTX"}' -p testuser1@active

# echo ""
# echo "unregister"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio unregprod '["testuser1"]' -p testuser1@active

# echo ""
# echo "unstake tokens (should work)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio undelegatebw '{"from":"testuser1", "receiver":"testuser1", "unstake_net_quantity":"75000000.0000 UTX", "unstake_cpu_quantity":"74000000.0000 UTX"}' -p testuser1@active

# echo ""
# echo "stake 140 million tokens (required for network activation)" 
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio delegatebw '{"from":"testuser1", "receiver":"testuser1", "stake_net_quantity":"70000000.0000 UTX", "stake_cpu_quantity":"70000000.0000 UTX", "transfer":0}' -p testuser1@active

# echo ""
# echo "register with sufficient stake (should work)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio regproducer '["testuser1", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "https://eostitan.com", 124]' -p testuser1@active

# echo ""
# echo "stake 10 million tokens"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio delegatebw '{"from":"testuser2", "receiver":"testuser2", "stake_net_quantity":"5000000.0000 UTX", "stake_cpu_quantity":"5000000.0000 UTX", "transfer":0}' -p testuser2@active

# echo ""
# echo "register with sufficient stake (should work)"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio regproducer '["testuser2", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "https://eostitan.com", 124]' -p testuser2@active

# echo ""
# echo "vote producer"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio voteproducer '{"voter":"testuser1", "proxy":"", "producers":["testuser1", "testuser2"]}' -p testuser1@active

########### // 

########### eosio.info tests


# echo "add KYC account testuser1"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkycacc '{"account":"testuser1"}' -p eosio@active

# echo "add key type passport verified - pav"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"pav", "definition":"Verification of passport", "user":false}' -p eosio@active

# echo "add key type driver's license verified - dlv"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"dlv", "definition":"Verification of driver license", "user":false}' -p eosio@active

# echo "add name user key"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"name", "definition":"Public user name", "user":true}' -p eosio@active

# echo "add key verification for testuser1"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info adduserver '{"kyc_account":"testuser1", "user":"testuser1", "verification_key":"pav"}' -p testuser1@active
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info adduserver '{"kyc_account":"testuser1", "user":"testuser1", "verification_key":"dlv"}' -p testuser1@active

# echo "add key verification for testuser2"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info adduserver '{"kyc_account":"testuser1", "user":"testuser2", "verification_key":"pav"}' -p testuser1@active

# echo "attempt to add user verification from non-permissined account (should fail)"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info adduserver '{"kyc_account":"testuser2", "user":"testuser2", "verification_key":"dlv"}' -p testuser2@active

# echo "add user defined key for testuser2"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info setuserkey '{"user":"testuser2", "key":"name", "memo":"Bob"}' -p testuser2@active

########### //

########### eosio.freeze tests

echo "add eosio.freeze to frozen accounts"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.freeze freezeacc '{"account":"eosio.freeze"}' -p eosio.freeze@owner

# echo "add testuser1 to frozen accounts"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.freeze freezeacc '{"account":"testuser1"}' -p testuser1@owner

# echo "attempt to update authorization (should fail)"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio updateauth '{"account":"testuser1", "permission":"active", "parent":"owner", "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "testuser1", "permission": "active"}}]}}' -p testuser1@active

# echo "attempts to update eosio.freeze code (should fail)"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 set contract eosio.freeze /root/contracts/ux.contracts/build/contracts/eosio.token/ eosio.token.wasm eosio.token.abi -p eosio.freeze@active

########### //


########### ownership tests
########### This contract will be residing on Worbli and on UX Network

# echo "test proof-of-ownership contract"
# docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.proof prove '{"user":"testuser1", "code":"00"}' -p testuser1@owner

########### //



########### UX Mainnet Bootstrapping Process

echo ""
echo "Creating UTX / UTXRAM Tokens"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token create '[ "eosio", "2500000000.0000 UTX"]' -p eosio.token@active
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token create '[ "eosio", "536870912.0000 UTXRAM"]' -p eosio.token@active #512 gb upperbound

echo ""
echo "Issuing UTXRAM token to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "1.0000 UTX", "eosio" ]' -p eosio@active

echo ""
echo "Issuing UTXRAM Token to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "1048576.0000 UTXRAM", "eosio" ]' -p eosio@active

echo ""
echo "Init eosio.system Contract"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio init '[0, "4,UTX"]' -p eosio@active

# echo ""
# echo "Buy RAM with UTXRAM (eosio)"
# docker exec -it $CONTAINER cleos  --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system buyram eosio eosio "1048576.0000 UTXRAM" -p eosio@active

# echo ""
# echo "Delegate UTX token to eosio"
# docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio delegatebw '[ "eosio", "eosio", "10000.0000 UTX", "10000.0000 UTX", false]' -p eosio@active

echo ""
echo "Setting global params"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio setparams '{"params":{"max_block_net_usage": 1048576, "target_block_net_usage_pct": 1000, "max_transaction_net_usage": 524288, "base_per_transaction_net_usage": 12, "net_usage_leeway": 500, "context_free_discount_net_usage_num": 20, "context_free_discount_net_usage_den": 100, "max_block_cpu_usage": 200000, "target_block_cpu_usage_pct": 1000, "max_transaction_cpu_usage": 150000, "min_transaction_cpu_usage": 100, "max_transaction_lifetime": 3600, "deferred_trx_expiration_window": 600, "max_transaction_delay": 3888000, "max_inline_action_size": 4096, "max_inline_action_depth": 6, "max_authority_depth": 6}}' -p eosio@active

########### //


########### creation + seeding of quibus account

echo ""
echo "Issuing UTXRAM to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "4000.0000 UTXRAM", "eosio" ]' -p eosio@active

echo ""
echo "Issuing UTX Token to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "18000000.0000 UTX", "eosio" ]' -p eosio@active

echo ""
echo "Creating quibus account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio quibus EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "17990000.0000 UTX" --buy-ram "4000.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period


########### //

########### creation + seeding of bp1, bp2, bp3, [...], bp21 account

echo ""
echo "Issuing UTXRAM to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "168.0000 UTXRAM", "eosio" ]' -p eosio@active

echo ""
echo "Issuing UTX Token to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "210000000.0000 UTX", "eosio" ]' -p eosio@active

echo ""
echo "Creating bp1 account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bp1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bp2 account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bp2 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bp3 account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bp3 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bp4 account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bp4 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bp5 account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bp5 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpa account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpa EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpb account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpb EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpc account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpc EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpd account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpd EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpe account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpe EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpf account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpf EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpg account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpg EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bph account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bph EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpi account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpi EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpj account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpj EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpk account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpk EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpl account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpl EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpm account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpm EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpn account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpn EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpo account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpo EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Creating bpp account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio bpp EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "9990000.0000 UTX" --buy-ram "8.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

echo ""
echo "Regproducer bp1"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bp1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bp2"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bp2 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bp3"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bp3 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bp4"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bp4 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bp5"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bp5 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpa"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpa EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpb"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpb EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpc"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpc EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpd"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpd EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpe"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpe EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpf"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpf EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpg"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpg EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bph"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bph EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpi"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpi EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpj"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpj EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpk"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpk EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpl"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpl EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpm"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpm EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpn"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpn EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpo"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpo EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 

echo ""
echo "Regproducer bpp"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system regproducer bpp EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV "" 0 


########### //

########### eosio.info setup

echo ""
echo "adding quibus account as kyc verifier account"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkycacc '{"account":"quibus"}' -p eosio@active

echo "add key type passport verified - passv"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"passv", "definition":"Verification of passport", "user":false}' -p eosio@active

echo "add key type driver's license verified - drliv"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"drliv", "definition":"Verification of driver license", "user":false}' -p eosio@active

echo "add key type government id verified - goidv"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"goidv", "definition":"Verification of government-issued ID", "user":false}' -p eosio@active

echo "add key type resident permit verified - repev"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"repev", "definition":"Verification of residence permit", "user":false}' -p eosio@active

echo "add key type address verified through utility bill - utbiv"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"utbiv", "definition":"Verification of utility bill", "user":false}' -p eosio@active

echo "add name user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"name", "definition":"Public user name", "user":true}' -p eosio@active

echo "add email user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"email", "definition":"Email Address", "user":true}' -p eosio@active

echo "add description user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"description", "definition":"Description or biography", "user":true}' -p eosio@active

echo "add linkedin user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"linkedin", "definition":"LinkedIn", "user":true}' -p eosio@active

echo "add telegram handle user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"telegram", "definition":"Telegram handle or channel link", "user":true}' -p eosio@active

echo "add twitter handle user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"twitter", "definition":"Twitter handle", "user":true}' -p eosio@active

echo "add website handle user key"
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info addkeytype '{"key":"website", "definition":"Website", "user":true}' -p eosio@active

########### //

########### asynchronous claim process over 1 month
########### creation + seeding of whale account upon all accounts claim completion

echo ""
echo "Issuing UTXRAM to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "4.0000 UTXRAM", "eosio" ]' -p eosio@active

echo ""
echo "Issuing UTX Token to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "180000000.0000 UTX", "eosio" ]' -p eosio@active

echo ""
echo "Creating whale account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 --verbose system newaccount eosio whale EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV --stake-net "10000.0000 UTX" --stake-cpu "179990000.0000 UTX" --buy-ram "4.0000 UTXRAM" --transfer # eosio stakes +/- 1% token supply to quibus for initial issuance + account creation, to be rescinded after claim period

# quibus writes verification status to eosio.info
echo "add key verification for whale by quibus" 
docker exec -it ux-main cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.info adduserver '{"kyc_account":"quibus", "user":"whale", "verification_key":"passv"}' -p quibus@active

########### //

########### issuance finalization + activation august 31st / september 1st

#issuing the UTXRAM tokens to whale (assuming 10% of total claimed tokens)

echo ""
echo "Issuing UTXRAM to eosio"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token issue '[ "eosio", "838860.8000 UTXRAM", "eosio" ]' -p eosio@active

echo ""
echo "Transfering tokens to whale"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio.token transfer '["eosio", "whale", "838860.8000 UTXRAM",  ""]' -p eosio@active

########### activation of chain by voting

echo ""
echo "Vote with whale account"
docker exec -it $CONTAINER cleos --url http://127.0.0.1:8888 --wallet-url http://ux-wallet:8901 push action eosio voteproducer '{"voter":"whale", "proxy":"", "producers":["bp1","bp2","bp3","bp4","bp5","bpa","bpb","bpc","bpd","bpe","bpf","bpg","bph","bpi","bpj","bpk","bpl","bpm","bpn","bpo","bpp"]}' -p whale@active

########### //
