import { ethers } from "hardhat";

async function main() {
  // We get the contract to deploy
  const Mapping = await ethers.getContractFactory("Mapping");
  const mapping = await Mapping.deploy();

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Deploying Contract ***");
  await mapping.deployed();
  console.log("Mapping deployed to:", mapping.address);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Set Round ***");
  await mapping.addFundingRound();
  console.log("Funding Rounds Added");

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Add Round ***");
  await mapping.addRound(2500, 1);
  console.log("Round added");

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Rounds Details ***");
  const response1 = await mapping.fundingRounds(0);
  console.log("Round Details : ", response1.toString());

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** User Round Details ***");
  const response2 = await mapping.getMyRoundInfo();
  console.log("User Round Details : ", response2.toString());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
