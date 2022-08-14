1. [Original repo](https://github.com/PatrickAlphaC/brownie_fund_me)

2. `payable` keyword in `fund` and `withdraw` function
- It is important to also provide the `payable` keyword here
- otherwise the function will automatically reject all Ether sent to it.

3. function modifier
- https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb

4. default network is rinkeby-fork, no mocking was used