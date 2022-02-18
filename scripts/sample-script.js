const hre = require("hardhat");

async function main() {
  console.log("Smart Contract deployed to:", greeter.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
