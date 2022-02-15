import { ethers } from "hardhat";
import { Structs, Structs__factory } from "../typechain";

async function main() {
  // We get the contract to deploy
  const Structs = await ethers.getContractFactory("Structs");
  const structs = await Structs.deploy();

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Deploying Contract ***");
  await structs.deployed();
  console.log("Structs deployed to:", structs.address);

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Set Book ***");
  await structs.setBook();
  console.log("Book Set");

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Get Book ID ***");
  const response = await structs.getBookId();
  console.log("ID of the book is : ", response.toString());

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Set Round ***");
  await structs.addFundingRound();
  console.log("Funding Rounds Added");

  console.log("---------------");
  console.log("---------------");
  console.log("---------------");
  console.log("*** Rounds Details in Start ***");
  const response1 = await structs.allRounds(0);
  console.log("Round Details : ", response1.toString());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
