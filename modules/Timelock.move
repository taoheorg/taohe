address {{sender}} {
module Timelock {
    resource struct Tao<Content> {
        content: Content,
        unlock_time: u64
    }

    public fun new<Content>(unlock_time: u64, content: Content): Tao<Content> {
        Tao<Content>{unlock_time, content}
    }
}
}