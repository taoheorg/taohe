# TaoHe/套盒 - Smart contract suite for Move
TaoHe is a collection of smart contract resources that can be nested inside each other in order to create secure on-chain applications on blockchains using MoveVM, such as Diem. Resources can be nested like a Russian doll (матрёшка), or Chinese boxes (套盒), the namesake of this project.

*Tao* is a simple Move resource that has been designed to be nested with other taos. TaoHe is a collection of taos, and a special RootTao.

## Design
Taos are meant to be disposable structures that can contain a meaningful resource (such as Diem tokens). In order to access the resource in question, taos must be dismantled. A new tao can be created though, if desired.

Design:

 * Encapsulating a meaningful resource (such as XUS) inside taos
 * By default a disposable structure: taos must be dismantled in order to get a mutable version of the meaningful resource
 * Root<Element> -> [Element, Element, Element [???, ???] ]
 * Resources must be nested
 * Code footprint is small per tao, easy to test and audit
 * Move footprint is delegated to scripts which are easier to change than on-chain code (otherwise taos could get difficul to use).
 * Only root is a standalone resource, others are not: this makes the other resources simple and safe.
 * DX not good at the moment, since types must be known before hand, and written in their full form, like: Folder::Folder<LibraTorch::Torch>
    * Maybe own YAML-like language?
 * Tao lifespan is of three stages: (creation, wrapping of resources) -> (reading immutable content, changing mutable states) -> (extracting, unwrapping of resources)
 * Does not replace smart contract development for complicated applications. Taos can be used as part of one, though.
 * Use folder to host mutable resources?

 * external/ is from Diem project, under Diem's Apache-2.0 License
 