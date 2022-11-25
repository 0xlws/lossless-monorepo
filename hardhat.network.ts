import { HardhatUserConfig } from 'hardhat/config';

const mnemonic = process.env.HDWALLET_MNEMONIC;
const privateKey = process.env.PRIVATE_KEY;

const networks: HardhatUserConfig['networks'] = {
  coverage: {
    url: 'http://127.0.0.1:8555',
    blockGasLimit: 200000000,
    allowUnlimitedContractSize: true,
  },
  localhost: {
    chainId: 1,
    url: 'http://127.0.0.1:8545',
    allowUnlimitedContractSize: true,
  },
  harmonyTestnet: {
    chainId: 1666700000,
    url: 'https://api.s0.b.hmny.io',
    accounts: [privateKey!],
  },
};

networks.hardhat = {
  allowUnlimitedContractSize: true,
  gas: 12000000,
  blockGasLimit: 0x1fffffffffffff,
};

if (mnemonic && !privateKey) {
  networks.harmonyTestnet = {
    chainId: 1666700000,
    url: 'https://api.s0.b.hmny.io',
    accounts: { mnemonic },
  };
}
if (privateKey) {
  networks.harmonyTestnet = {
    chainId: 1666700000,
    url: 'https://api.s0.b.hmny.io',
    accounts: [privateKey],
  };
}

export default networks;
