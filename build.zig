const std = @import("std");

pub fn build(b: *std.Build) void {
    b.sysroot = "./android/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/";
    b.addSearchPrefix("./android/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/");

    const target = b.resolveTargetQuery(.{
        .cpu_arch = .aarch64,
        .os_tag = .linux,
        .abi = .android,
    });

    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addSharedLibrary(.{
        .name = "main",
        .root_source_file = .{
            .cwd_relative = "src/main.zig"
        },
        .target = target,
        .optimize = optimize,
    });
    
    lib.addLibraryPath(.{
        .cwd_relative = "raylib/src"
    });
    lib.linkSystemLibrary("raylib");
    lib.addIncludePath(.{
        .cwd_relative = "raylib/src/"
    });

    b.installArtifact(lib);
}
