# 回 TaoHe: Collection of nestable smart contract resources on MoveVM blockchains 
TaoHe is a collection of smart contract resources that can be nested inside each other in order to create secure on-chain applications on blockchains using MoveVM, such as Diem. Resources can be nested like a Russian doll (матрёшка), or Chinese boxes (套盒), the namesake of this project. 回 is used as the logo, since it depicts a box inside another box.

*Tao* is a simple Move resource that has been designed to be nested inside other taos. TaoHe is a collection of taos, and a special Root resource that can be used to store a resource directly into an account (taos themselves can be stored into resources only, for simplicity).

> **Example**: You could place Diem tokens into a timelocked tao, and place that inside an NFT tao, effectively creating a non-fungible timelocked token.

## Design
### What taos are
Taos are meant to form disposable structures that contain a meaningful resource (such as Diem tokens). In order to access the resource in question, taos must be dismantled. A new tao can be created though, if so desired. Nesting taos inside each other can form complicated logics, such as timelocked non-fungible tokens.

### Why taos are small
Keeping code footprint per each tao in minimum is vital for safer code, and is simplier to audit. Keeping taos simple also shifts the code footprint to scripts, which are easier to develop and update than smart contracts.

### Tao lifespan
Tao's lifespan is divided into three separate phases, listed here chronologically:
 * **Creation**: Tao is created by placing a resource into the tao, and initializing it with the constructor's arguments.
 * **Static**: During tao's existence, primarly resource reading (immutable references) is supported. However, in the future mutable references might also be supported.
 * **Extraction**: When conditions are satisfied (such as passed time), the resource inside the tao is given away, and the tao is destroyed.

### What taos are not
Taos are not meant to replace specialized smart contract development for complicated applications, but can be used as part of one.

## Problems
### Move is under heavy development
Move is changing rapidly at the moment, the chances are that when you clone this repository, the Move language already has updated, and this does not compile at all :D

### Poor developer experience
DX not good at the moment, since types must be known before hand, and written in their full form, like: Folder::Folder<LibraTorch::Torch>. This could be solved by creating a intermediate Yaml based description language which can be used to generate transaction script modules (a new feature).

## Legal
This repository is released under the *Apache License 2.0*. Original content is copyrighted to *Solarius Properties Ky* (Forssa, Finland, EU), and content in [external/](external/) is copyrighted to the *Diem Association* (Geneva, Switzerland), also under the same license. The *external* directory is meant to host 3rd party code available already on-chain, and is not part of the TaoHe project per se.
