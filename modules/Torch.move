address {{sender}} {
module Torch {
    resource struct Tao {}

    public fun new(): Tao {
        Tao{}
    }

    public fun destroy(tao: Tao) {
        let Tao{} = tao;
    }
}
}