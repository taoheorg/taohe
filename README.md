# ▣ TaoHe: Collection of nestable Move resources
[![Mentioned in Awesome Move](https://awesome.re/mentioned-badge-flat.svg)](https://github.com/MystenLabs/awesome-move#libraries) ![GitHub](https://img.shields.io/github/license/taoheorg/taohe) [![Movey](https://img.shields.io/badge/Movey-TaoHe-001f60)](https://www.movey.net/packages/TaoHe)

TaoHe is a collection of nestable smart contract resources that can be used to create secure on-chain applications on various [Move-powered blockchains](https://github.com/MystenLabs/awesome-move#move-powered-blockchains). Resources can be nested like a Russian doll ([матрёшка](https://en.wikipedia.org/wiki/Matryoshka_doll)), or Chinese boxes ([套盒](https://en.wikipedia.org/wiki/Chinese_boxes)), the namesake of this project. ▣ is used as the logo, since it depicts a box inside another box.

*Tao* is a simple Move resource that has been designed to be nested inside other taos. *TaoHe* is a collection of taos, and a special Root resource that can be used to store a resource directly into an account (taos themselves can be stored into resources only, for simplicity).

TaoHe follows the [Nestable Resources](http://www.move-patterns.com/nestable_resources.html) software design pattern.

> **Example**: Tokens can be placed into a time locked resource ([Timelock](sources/Timelock.move)), which in turn can be placed into a resource which can be used only by a certain user ([Ownable](sources/Ownable.move)), effectively creating a timelocked non-fungible token.

[See TaoHe on Movey](https://www.movey.net/packages/TaoHe), the package metadata repository for Move. Archived version of the original announcement can be found [here](https://web.archive.org/web/20211130211800/https://community.diem.com/t/introducing-taohe-collection-of-nestable-move-resources/3531).

## Design
### What taos are
Taos are meant to form disposable structures that contain a meaningful resource (such as tokens). In order to access the resource in question, taos must be dismantled. A new tao can be created though, if so desired. Nesting taos inside each other can form complicated logics, such as timelocked non-fungible tokens.

### Why taos are small
Keeping code footprint per each tao in minimum is vital for safer code, and is simpler to audit. Keeping taos simple also shifts the code footprint to scripts, which are easier to develop and update than smart contracts.

### Tao lifespan
Tao's lifespan is divided into three separate phases, listed here chronologically:
 * **Wrap**: Tao is created by placing a resource into the tao, and initializing it with the constructor's arguments.
 * **Wrapped**: In the current design taos are static, with support of immutable references to the resource(s) inside.
 * **Unwrap**: When conditions are satisfied (such as passed time), the resource inside the tao is given away, and the tao is destroyed.

### What taos are not
Taos are not meant to replace specialized smart contract development for complicated applications, but can be used as part of one.

## Building and developing
TaoHe is developed with [Microsoft's Visual Studio Code](https://code.visualstudio.com/) and the [`Move Language` plugin](https://marketplace.visualstudio.com/items?itemName=PontemNetwork.move-language).

We use **[Dove build system 1.7.1](https://github.com/pontem-network/move-tools/releases/tag/1.7.1)** for building, package management, dependencies, formal verification and testing. After successful Dove installation, you can just run:
```
dove build
```

> **Jumpstart**: `dove run -v "dummy()"` (replace `dummy` with any function residing in [scripts/](scripts/))

### Selecting blockchain
TaoHe is designed to support every Move powered blockchain. This is achieved by *Adapters*, which is a thin middleware between TaoHe and the desired target blockchain. At the moment only the [Dummy Adapter](https://github.com/taoheorg/adapter-dummy) is available for easier testing and development, but you can search GitHub for other [Move Adapters](https://github.com/topics/move-adapter).

To change the adapter, replace the `Adapter` dependency with your desired adapter in your `Move.toml`.

### Formal verification
Every tao has formal verification specs embedded. You can run the formal verification by running:
```
dove prove
```

> Learn more about installing the formal verification tools and dependencies [here](https://github.com/move-language/move/blob/main/language/move-prover/doc/user/install.md).

> **Warning**: Although every tao has formal verification specs, `move-prover` is still under development, and might have some limitations. Please see each source file for more information.

### Using TaoHe for your projects
You can also add TaoHe as a dependency for your Dove based project by adding these lines to your project's `Move.toml`:

```
[addresses]
TaoHe = "0x2f66c09143acc52a85fec529a4e20c85"

[dependencies.TaoHe]
git = "https://github.com/taoheorg/taohe"
rev="...."
```

> **Warning**: Due to signed commits, commit hash should be used since it cannot be spoofed. After you know which TaoHe version you want to use, replace `rev` with your desired commit hash.

## Known problems
### Poor developer experience
DX is not good at the moment since types must be known beforehand, and written in their full form, resulting in lengthy inscrutable lines of code. This could be solved by creating an intermediate Yaml based description language which could be used to generate transaction scripts and transaction script functions (a new Move feature).

## Documentation
See [doc/](doc/) for `dove prove -- --docgen` generated documentation.

## License
This repository is released under the *Apache License 2.0*, and is copyrighted to *Solarius Intellectual Properties Ky* (Forssa, Finland, EU). See `Move.toml` for more information on dependencies. No warranty or fitness for a particular purpose provided, as stipulated in [the License](https://github.com/taoheorg/taohe/blob/main/LICENSE#L143).

## Trusted source
Smart contracts are mission critical and as such should always originate from trusted sources. That's why every commit on `main` is signed with [Ville's GPG key](https://keys.openpgp.org/search?q=0x49065E1275E46F96). Upstream repository is [here](https://github.com/taoheorg/taohe/) and the official webpage is at [www.taohe.org](https://www.taohe.org).