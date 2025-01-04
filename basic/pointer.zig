const print = @import("std").debug.print;
pub fn main() !void {
    // try SinglePointer.main();
    // try MutliPointer.main();
    try Slice.main();
}

// 单项指针
const SinglePointer = struct {
    // #region single_pointer

    pub fn main() !void {
        var integer: i16 = 666;
        const ptr = &integer;
        ptr.* = ptr.* + 1;

        print("{}\n", .{integer});
    }
    // #endregion single_pointer
};

const MutliPointer = struct {
    // #region multi_pointer
    pub fn main() !void {
        var array = [_]i32{ 1, 2, 3, 4 };
        const ptr: [*]const i32 = &array;

        array[0] = 100;
        print("第一个元素：{}\n", .{ptr[0]});
        print("第1..2个元素：{any}\n", .{ptr[2..array.len]});
        print("第prt+1个元素：{any}\n", .{(ptr + 1)[0]});
    }
    // #endregion multi_pointer
};

const Slice = struct {
    pub fn main() !void {
        var array = [_]i32{ 1, 2, 3, 4 };
        const arr_ptr: *const [4]i32 = &array;

        print("数组第一个元素为：{}\n", .{arr_ptr[0]});
        print("数组长度为：{}\n", .{arr_ptr.len});

        const slice = array[1 .. array.len - 1];
        const slice_ptr: []i32 = slice;

        print("切片第一个元素为：{}\n", .{slice_ptr[0]});
        print("切片长度为：{}\n", .{slice_ptr.len});
    }
    // #endregion slice
};
