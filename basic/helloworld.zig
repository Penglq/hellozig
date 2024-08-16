pub fn main() !void {
    One.main();
}

const One = struct {
    const std = @import("std");
    pub fn main() void {
        std.debug.print("Hello World!\n", .{});
    }
};
