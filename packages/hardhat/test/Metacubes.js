const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Metacubes Test", function () {
  it("Should successfully deploy with expected defaults", async function () {
    const Metacubes = await ethers.getContractFactory("Metacubes");
    const metacubes = await Metacubes.deploy("Hello, world!");
    await metacubes.deployed();

    expect(await metacubes.getContestReady()).to.equal(false);
    expect(await metacubes.getContestStarted()).to.equal(false);
    expect(await metacubes.getRefundMode()).to.equal(false);
  });

  it("Should toggle options successfully successfully", async function () {
    const Metacubes = await ethers.getContractFactory("Metacubes");
    const metacubes = await Metacubes.deploy("Hello, world!");
    await metacubes.deployed();

    const toggleContestTx = await metacubes.toggleContestReady();
    await toggleContestTx.wait();
    expect(await metacubes.getContestReady()).to.equal(true);

    const toggleContestTx2 = await metacubes.toggleContestReady();
    await toggleContestTx2.wait();
    expect(await metacubes.getContestReady()).to.equal(false);

    const toggleRefundTx = await metacubes.toggleRefundMode();
    await toggleRefundTx.wait();
    expect(await metacubes.getRefundMode()).to.equal(true);

    const toggleRefundTx2 = await metacubes.toggleRefundMode();
    await toggleRefundTx2.wait();
    expect(await metacubes.getRefundMode()).to.equal(false);
  });
});
