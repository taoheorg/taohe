address {{sender}} {
module Root {
    use 0x1::Signer;

    resource struct Root<Content> {
        content: Content
    }

    public fun create<Content>(account: &signer, content: Content) {
        move_to<Root<Content>>(account, Root<Content>{ content: content });
    }

    public fun extract<Content: resource>(account: &signer): Content acquires Root {
        let owner = Signer::address_of(account);
        let root = move_from<Root<Content>>(owner);
        let Root<Content> { content } = root;

        content
    }
}
}