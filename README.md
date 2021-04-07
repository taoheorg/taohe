# 回 TaoHe: Collection of nestable Move resources
TaoHe is a collection of nestable smart contract resources that can be used to create secure on-chain applications on MoveVM blockchains, such as **Diem**. Resources can be nested like a Russian doll (матрёшка), or Chinese boxes (套盒), the namesake of this project. 回 is used as the logo, since it depicts a box inside another box.

*Tao* is a simple Move resource that has been designed to be nested inside other taos. *TaoHe* is a collection of taos, and a special Root resource that can be used to store a resource directly into an account (taos themselves can be stored into resources only, for simplicity).

> **Example**: You could place Diem tokens into a time locked tao, and place that inside an NFT tao, effectively creating a non-fungible time locked token.

## Design
### What taos are
Taos are meant to form disposable structures that contain a meaningful resource (such as Diem tokens). In order to access the resource in question, taos must be dismantled. A new tao can be created though, if so desired. Nesting taos inside each other can form complicated logics, such as time locked non-fungible tokens.

### Why taos are small
Keeping code footprint per each tao in minimum is vital for safer code, and is simpler to audit. Keeping taos simple also shifts the code footprint to scripts, which are easier to develop and update than smart contracts.

### Tao lifespan
Tao's lifespan is divided into three separate phases, listed here chronologically:
 * **Creation**: Tao is created by placing a resource into the tao, and initializing it with the constructor's arguments.
 * **Static**: During tao's existence, primarily resource reading (immutable references) will be supported. However, in the future mutable references might also be supported.
 * **Extraction**: When conditions are satisfied (such as passed time), the resource inside the tao is given away, and the tao is destroyed.

### What taos are not
Taos are not meant to replace specialized smart contract development for complicated applications, but can be used as part of one.

## Building and developing
TaoHe is developed with [Microsoft's Visual Studio Code](https://code.visualstudio.com/), and [damirka's great `Move IDE` plugin](https://marketplace.visualstudio.com/items?itemName=damirka.move-ide).

**Build system**: We use [Dove](https://github.com/pontem-network/move-tools) build system. After successful Dove installation, you can just run:
`dove build`
You can also add TaoHe as a dependency for your Dove based project. 

> **Jumpstart**: `dove run timelock.move` (replace timelock.move with any script residing in [scripts/](scripts/))

## Known problems
### Move is under heavy development
Move is changing rapidly at the moment, the chances are that when you clone this repository, the Move language already has changed, and this does not compile at all 😆

### Poor developer experience
DX is not good at the moment, since types must be known beforehand, and written in their full form, resulting in lengthy inscrutable lines of code. This could be solved by creating an intermediate Yaml based description language which could be used to generate transaction scripts and transaction script modules (a new Move feature).

## Legal
This repository is released under the *Apache License 2.0*. Original content is copyrighted to *Solarius Properties Ky* (Forssa, Finland, EU), and content in [external/](external/) is copyrighted to the *Diem Association* (Geneva, Switzerland), also under the same license. The *external* directory is meant to host 3rd party code available already on-chain, and is not part of the TaoHe project per se.

## Trusted source
Smart contracts are mission critical and as such should always originate from trusted sources. That's why every commit on `master` is signed with [Ville's GPG key](http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0x49065E1275E46F96). Upstream repository is [here](https://github.com/taoheorg/taohe/) and the official webpage is at [www.taohe.org](https://www.taohe.org).