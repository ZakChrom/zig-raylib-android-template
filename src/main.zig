const std = @import("std");
const r = @cImport({
    @cInclude("raylib.h");
});

export fn main(argc: c_int, argv: [*c][*c]const c_char) callconv(.C) c_int {
    _ = argc;
    _ = argv;
    r.InitWindow(1080, 720, "Urmom");
    r.SetTargetFPS(144);
    while (!r.WindowShouldClose()) {
        r.BeginDrawing();
            r.ClearBackground(r.Color {
                .r = 0x7a,
                .g = 0,
                .b = 255,
                .a = 255
            });
        r.EndDrawing();
    }
    r.CloseWindow();

    return 0;
}