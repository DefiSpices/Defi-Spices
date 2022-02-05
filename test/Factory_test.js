const ErcFactory = artifacts.require("ErcFactory");
const ERC20 = artifacts.require("ERC20_Standard");



contract('ErcFactory', (accounts)=>{

  let _totalSupply = "1000000000000000000"
  let _name = "myToken";
  let _symbol = "MT"

  let ercFactory,tokenAddress,newToken

  before(async()=>{
    ercFactory = await ErcFactory.new()

  })

  describe('Factory deployment', async()=>{
    it("should deploy the factory contract proprley", async()=>{
      assert(ercFactory.address != '')
      console.log(ercFactory.address)
    })
  })


  describe('create Token', async()=>{
    before(async()=>{
       recipt = await ercFactory.createStandardToken(_totalSupply, _name, _symbol)
       tokenAddress = recipt.logs[0].args._tokenAddress
    })


    it("should create a token and check the new token if deployed proprley", async()=>{
      assert(tokenAddress!='')

      newToken = new web3.eth.Contract(ERC20.abi, tokenAddress)


      let totalSupply = await newToken.methods.totalSupply().call();
      let name = await newToken.methods.name().call();
      let symbol = await newToken.methods.symbol().call();

      assert.equal(totalSupply, _totalSupply)
      assert.equal(name, _name)
      assert.equal(symbol, _symbol)
    })

  })

})
