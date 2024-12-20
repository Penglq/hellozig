pub fn main() !void {
    // CreateArray.main();
    // TerminatedArray.main();
    PrintArr.main();
}

const CreateArray = struct {
    const print = @import("std").debug.print;

    pub fn main() void {
        const msg = [5]u8{ 'h', 'e', 'l', 'l', 'o' };

        print("{s}\n", .{msg});
        print("{c}\n", .{msg[0]});
    }
};

const TerminatedArray = struct {
    // #region terminated_array
    const print = @import("std").debug.print;

    pub fn main() void {
        const array = [_:0]u8{ 1, 2, 3, 4 };
        print("数组长度为: {}\n", .{array.len}); // 4
        print("数组最后一个元素值: {}\n", .{array[array.len - 1]}); // 4
        print("哨兵值为: {}\n", .{array[array.len]}); // 0
    }
    // #endregion terminated_array
};

const Multiply = struct {
    // #region multiply
    const print = @import("std").debug.print;

    pub fn main() void {
        const small = [3]i8{ 1, 2, 3 };
        const big: [9]i8 = small ** 3;
        print("{any}\n", .{big}); // [9]i8{ 1, 2, 3, 1, 2, 3, 1, 2, 3 }
    }
    // #endregion multiply
};

const Connect = struct {
    // #region connect
    const print = @import("std").debug.print;

    pub fn main() void {
        const part_one = [_]i32{ 1, 2, 3, 4 };
        const part_two = [_]i32{ 5, 6, 7, 8 };
        const all_of_it = part_one ++ part_two; // [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }

        _ = all_of_it;
    }
    // #endregion connect
};

const String = struct {
    // #region string
    const print = @import("std").debug.print;
    const mem = @import("std").mem; // 用于比较字节

    pub fn main() void {
        const bytes = "hello";
        print("{}\n", .{@TypeOf(bytes)}); // *const [5:0]u8
        print("{d}\n", .{bytes.len}); // 5
        print("{c}\n", .{bytes[1]}); // 'e'
        print("{d}\n", .{bytes[5]}); // 0
        print("{}\n", .{'e' == '\x65'}); // true
        print("{d}\n", .{'\u{1f4a9}'}); // 128169
        print("{d}\n", .{'💯'}); // 128175
        print("{u}\n", .{'⚡'});
        print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")}); // true
        print("{}\n", .{mem.eql(u8, "💯", "\xf0\x9f\x92\xaf")}); // true
        const invalid_utf8 = "\xff\xfe"; // 非UTF-8 字符串可以使用\xNN.
        print("0x{x}\n", .{invalid_utf8[1]}); // 索引它们会返回独立的字节
        print("0x{x}\n", .{"💯"[1]});
    }
    // #endregion string
};

const FuncInitArray = struct {
    // #region func_init_array
    const print = @import("std").debug.print;

    pub fn main() void {
        const array = [_]i32{make(3)} ** 10;
        print("{any}\n", .{array});
    }

    fn make(x: i32) i32 {
        return x + 1;
    }
    // #endregion func_init_array
};

const ComptimeInitArray = struct {
    // #region comptime_init_array
    const print = @import("std").debug.print;

    pub fn main() void {
        const fancy_array = init: {
            var initial_value: [10]usize = undefined;
            for (&initial_value, 0..) |*pt, i| {
                pt.* = i;
            }
            break :init initial_value;
        };
        print("{any}\n", .{fancy_array});
    }
    // #endregion comptime_init_array
};

const PrintArr = struct {
    const print = @import("std").debug.print;

    pub fn main() void {
        const part_one = [_]i32{ 1, 2, 3, 4 };
        const part_two = [_]i32{ 5, 6, 7, 8 };
        const all_of_it = part_one ++ part_two; // [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }

        for (all_of_it, 1.., 9..) |value, k, k2| {
            print("{d}--{d}--{d}\n", .{ k, value, k2 });
        }
    }
};
