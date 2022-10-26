const Dogs = artifacts.require('Dog');
const DogsUpdated = artifacts.require('DogUpdated');
const Proxy = artifacts.require('Proxy');

module.exports = async function(deployer, network, accounts){
    const dogs = await Dogs.new();
    const proxy = await Proxy.new(dogs.address);

    var proxyDog = await Dogs.at(proxy.address);
    await proxyDog.setNumberofDogs(10);
    var nrOfdogs = await proxyDog.getNumberofDogs();
    console.log("Before Update: " + nrOfdogs.toNumber());  


    const dogsUpdated = await DogsUpdated.new();
    proxy.upgrade(dogsUpdated.address);
  
    proxyDog = await DogsUpdated.at(proxy.address);
    proxyDog.initialize(accounts[0]);

    nrOfdogs = await proxyDog.getNumberofDogs();
    console.log("After Update: "+ nrOfdogs.toNumber()); 

    await proxyDog.setNumberofDogs(30);
    
    nrOfdogs = await proxyDog.getNumberofDogs();
    console.log("After Update: "+ nrOfdogs.toNumber());
}