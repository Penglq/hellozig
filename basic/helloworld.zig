pub fn main() !void {
    One.main();
    try Two.main();
    try Three.main();
}

const One = struct {
    const std = @import("std");
    pub fn main() void {
        std.debug.print("Hello World!\n", .{});
    }
};

const Two = struct {
    const std = @import("std");
    pub fn main() !void {
        var out = std.io.getStdOut().writer();
        var err = std.io.getStdErr().writer();

        try out.print("hello {s}!\n", .{"out"});
        try err.print("Hello {s}!\n", .{"err"});
    }
};

const Three = struct {
    const std = @import("std");
    pub fn main() !void {
        const out = std.io.getStdOut().writer();

        // 获取buffer// [!code focus]
        var out_buffer = std.io.bufferedWriter(out);

        // 获取writer句柄// [!code focus]
        var out_writer = out_buffer.writer(); // [!code focus]

        // 通过句柄写入buffer// [!code focus]
        try out_writer.print("Hello {s}!\n", .{"out"}); // [!code focus]

        // 尝试刷新buffer// [!code focus]
        try out_buffer.flush(); // [!code focus]
    }
};
