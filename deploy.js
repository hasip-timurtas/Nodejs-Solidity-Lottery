const HDWalletProvider = require('@truffle/hdwallet-provider');
const { Web3 } = require('web3');
const { interface, bytecode } = require('./compile');
require('dotenv').config();

const provider = new HDWalletProvider(process.env.MNEMONIC, process.env.INFURA_URL);