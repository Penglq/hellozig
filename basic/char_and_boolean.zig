const print = @import("std").debug.print;

pub fn main() !void {
    // CHAR.main();
    // CHAR_ASCII.main();
    String.main();
}

const CHAR = struct {
    // #region char

    pub fn main() void {
        const char: u8 = 'h';
        print("{c}\n", .{char});
    }
    // #endregion char
};

const CHAR_ASCII = struct {
    // #region char_ascii

    pub fn main() void {
        const char: u8 = 'h';
        const char_num: u8 = 104;
        print("{c}\n", .{char});
        print("{c}\n", .{char_num});
    }
    // #endregion char_ascii
};

const String = struct {
    pub fn main() void {
        // 存储的是 UTF-8 编码序列
        const bytes = "Hello, 世界！";

        print("{}\n", .{@TypeOf(bytes)}); // *const [16:0]u8
        print("{}\n", .{bytes.len}); // 16

        // 通过索引访问到的是 UTF-8 编码序列中的字节
        // 由于 UTF-8 兼容 ASCII，所以可以直接打印 ASCII 字符
        print("{c}\n", .{bytes[1]}); // 'e'

        // “世”字的 UTF-8 编码为 E4 B8 96
        // 以 NUL 结尾
        print("{x}\n", .{bytes[7]}); // 0
        print("{x}\n", .{bytes[8]}); // 0
        print("{x}\n", .{bytes[9]}); // 0
        print("{d}\n", .{bytes[16]}); // 0
    }
};
