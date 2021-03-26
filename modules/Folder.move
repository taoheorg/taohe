address {{sender}} {
module Folder {
    use 0x1::Vector;

    resource struct Tao<Content> {
        content: vector<Content>
    }

    public fun new<Content>(content: vector<Content>): Tao<Content> {
        Tao<Content> { content }
    }

    public fun extract<Content>(tao: &mut Tao<Content>): Content {
        Vector::pop_back<Content>(&mut tao.content)
    }
}
}