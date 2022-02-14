import { ethers } from "hardhat";
import { Enums, Enums__factory } from "../typechain";

async function main() {
  // We get the contract to deploy
  const Enums = await ethers.getContractFactory("Enums");
  const enums = await Enums.deploy();

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Deploying Contract ***");
  await enums.deployed();
  console.log("Enums deployed to:", enums.address);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Get Default ***");
  const response = await enums.getJuice();
  console.log("Default Juice size :", response);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Verfiy ***");
  const response1 = await enums.verifyJuiceSize();
  console.log("Default Juice Size is extra large :", response1);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Update Default ***");
  await enums.updateJuiceSize(3);
  console.log("Juice size updated to:", await enums.getJuice());

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Verfiy ***");
  const response2 = await enums.verifyJuiceSize();
  console.log("Default Juice Size is extra large :", response2);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Update Default with error ***");
  await enums.updateJuiceSizeError(10);
  console.log("Juice size updated to:", await enums.getJuice());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
