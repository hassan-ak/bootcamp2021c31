import { ethers } from "hardhat";
import { Conversions, Conversions__factory } from "../typechain";

async function main() {
  // We get the contract to deploy

  // const Conversions: Conversions__factory = await ethers.getContractFactory(
  //   "Conversions"
  // );
  // const conversions: Conversions = await Conversions.deploy();

  const Conversions = await ethers.getContractFactory("Conversions");
  const conversions = await Conversions.deploy();

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Deploying Contract ***");
  await conversions.deployed();
  console.log("Conversions deployed to:", conversions.address);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Apply Conversios ***");
  const response = await conversions.applyConversion();
  console.log("Results : ", response.toString());

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Apply Conversios ***");
  const response1 = await conversions.applyConversion1();
  console.log("Results : ", response1.toString());

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Apply Conversios ***");
  const response2 = await conversions.applyConversion2();
  console.log("Results : ", response2.toString());

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Apply Conversios ***");
  const response3 = await conversions.applyConversion3();
  console.log("Results : ", response3.toString());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
