const print = @import("std").debug.print;

pub fn main() !void {
    // print("{}\n", .{add(1, 2)});
    // print("{}\n", .{max(u8, 3, 4)});
    // print("{d}\n", .{@max(3, 4)}); // 内建函数 https://ziglang.org/documentation/master/#toc-Builtin-Functions
    // print("{}\n", .{addFortyTwo(2)});
    var a: u16 = 1;
    a += 1;
    print("{}\n", .{@TypeOf(a)});
}

fn add(a: u8, b: u8) u8 {
    return a + b;
}

fn max(comptime X: type, a: X, b: X) X {
    return if (a > b) a else b;
}

fn addFortyTwo(x: anytype) @TypeOf(x) {
    return x + 42;
}
