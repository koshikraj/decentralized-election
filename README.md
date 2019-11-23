
# Decentralized Election
Most existing E-Voting systems are based on centralized servers where the voters must trust the organizing authority for the election process and the integrity of the results. In this use case discussion, we will implements a decentralized trustless voting platform on Ethereum blockchain. The main features of this system include ensuring data integrity and transparency, and enforcing one vote per candidate with ensured privacy.

## Quick Start

Install contract framework and private blockchain

Truffle and Ganache can be installed as a node module.

```text
$ npm install -g truffle
```

```text
$ npm install -g ganache-cli
```


### Launch local blockchain (Ganache)

```text
ganache-cli --seed test
```

### Test, compile and deploy the contract

```text
 $ truffle test
 $ truffle migrate
```

### Start the client application

Install the node dependencies.

```text
npm install
```

Run the app in the development mode.<br>

```text
npm start
```
Open [http://localhost:8080](http://localhost:800) to view it in the browser.


Finally, the build for the production can also be generated 

```text
npm build
```
