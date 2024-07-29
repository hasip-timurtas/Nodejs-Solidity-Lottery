# NodeJS-Solidity Integration

This project demonstrates how to integrate Solidity smart contracts with a Node.js environment. It includes scripts for compiling, deploying, and testing smart contracts.

## Features

- **Smart Contract Development**: Write and manage Solidity contracts.
- **Compilation**: Compile Solidity contracts using `compile.js`.
- **Deployment**: Deploy contracts to the Ethereum network with `deploy.js`.
- **Testing**: Run comprehensive tests using the scripts in the `test` folder.

## Prerequisites

- Node.js
- npm or yarn
- Solidity Compiler

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/hasip-timurtas/nodejs-solidity.git
    cd nodejs-solidity
    ```
2. Install dependencies:
    ```bash
    npm install
    ```

## Usage

### Compile Contracts

```bash
node compile.js
```

### Deploy Contracts

Update deployment parameters in `deploy.js`, then run:

```bash
node deploy.js
```

### Test Contracts

Add your tests in the `test` folder and run:

```bash
npm test
```

## Folder Structure

- `contracts/`: Solidity smart contracts.
- `test/`: Test scripts.
- `compile.js`: Compilation script.
- `deploy.js`: Deployment script.

## Contributing

Feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License.
