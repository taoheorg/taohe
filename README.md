# 回 TaoHe: Collection of nestable Move resources
TaoHe is a collection of nestable smart contract resources that can be used to create secure on-chain applications on MoveVM blockchains, such as **Diem**. Resources can be nested like a Russian doll ([матрёшка](https://en.wikipedia.org/wiki/Matryoshka_doll)), or Chinese boxes ([套盒](https://en.wikipedia.org/wiki/Chinese_boxes)), the namesake of this project. 回 is used as the logo, since it depicts a box inside another box.

*Tao* is a simple Move resource that has been designed to be nested inside other taos. *TaoHe* is a collection of taos, and a special Root resource that can be used to store a resource directly into an account (taos themselves can be stored into resources only, for simplicity).

> **Example**: You could place Diem tokens into a time locked tao, and place that inside an NFT tao, effectively creating a non-fungible time locked token.

[Participate to TaoHe discussion on Diem Community](https://community.diem.com/t/introducing-taohe-collection-of-nestable-move-resources).

## Design
### What taos are
Taos are meant to form disposable structures that contain a meaningful resource (such as Diem tokens). In order to access the resource in question, taos must be dismantled. A new tao can be created though, if so desired. Nesting taos inside each other can form complicated logics, such as time locked non-fungible tokens.

### Why taos are small
Keeping code footprint per each tao in minimum is vital for safer code, and is simpler to audit. Keeping taos simple also shifts the code footprint to scripts, which are easier to develop and update than smart contracts.

### Tao lifespan
Tao's lifespan is divided into three separate phases, listed here chronologically:
 * **Creation**: Tao is created by placing a resource into the tao, and initializing it with the constructor's arguments.
 * **Static**: In the current design taos are static, but it is possible that in the future immutable (and even mutable) references might be supported.
 * **Extraction**: When conditions are satisfied (such as passed time), the resource inside the tao is given away, and the tao is destroyed.

### What taos are not
Taos are not meant to replace specialized smart contract development for complicated applications, but can be used as part of one.

## Building and developing
TaoHe is developed with [Microsoft's Visual Studio Code](https://code.visualstudio.com/), and [damirka's great `Move IDE` plugin](https://marketplace.visualstudio.com/items?itemName=damirka.move-ide).

We use **[Dove build system 1.2.8](https://github.com/pontem-network/move-tools/releases/tag/1.2.8)** for building, package management, dependencies, and testing. After successful Dove installation, you can just run:
`dove build`

> **Jumpstart**: `dove run --file immutable` (replace timelock.move with any script residing in [scripts/](scripts/))

### Formal verification
Every tao has formal verification specs embedded. You can run the formal verification by running:
`dove prove` (If Dove has been compiled with `--features prover`, to be enabled by default in 1.3.0)

> **Warning**: Althought every tao has formal verification specs, `move-prover` is still under development, and might have some limitations. Please see each source file for more information.

### Using TaoHe for your projects
You can also add TaoHe as a dependency for your Dove based project by adding this line to your project's Dove.toml:
`dependencies = [{ git = "https://github.com/taoheorg/taohe", rev="c3b766a3a7e7ca05d9dbf68dfe9c5e6f6fd44131" }]`

> **Warning**: Due to signed commits, commit hash should be used, since it cannot be spoofed. After you know which TaoHe version you want to use, replace `rev` with your desired commit hash.

## Known problems
### Poor developer experience
DX is not good at the moment, since types must be known beforehand, and written in their full form, resulting in lengthy inscrutable lines of code. This could be solved by creating an intermediate Yaml based description language which could be used to generate transaction scripts and transaction script modules (a new Move feature).

## Legal
This repository is released under the *Apache License 2.0*, and is originally copyrighted to *Solarius Intellectual Properties Ky* (Forssa, Finland, EU). This project currently depends on [diem-stdlib](https://github.com/taoheorg/diem-stdlib) and [move-stdlib](https://github.com/taoheorg/move-stdlib).

## Documentation
See [doc/](doc/) for `move-prover` generated documentation.

## Trusted source
Smart contracts are mission critical and as such should always originate from trusted sources. That's why every commit on `master` is signed with [Ville's GPG key](http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0x49065E1275E46F96). Upstream repository is [here](https://github.com/taoheorg/taohe/) and the official webpage is at [www.taohe.org](https://www.taohe.org).