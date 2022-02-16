import { ethers } from "hardhat";

async function main() {
  const etherValue = await ethers.utils.parseEther("1");
  console.log("Ether Value = ", etherValue.toString());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
