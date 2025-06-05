module tb_wallece_tree_4x4();

reg [3:0] A, B;
wire [7:0] Prod;

wallece_tree_4x4 uut (
    .A(A),
    .B(B),
    .Prod(Prod)
);

integer i, j;
reg [7:0] expected;

initial begin
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            A = i;
            B = j;
            #10;  // Çıkışın stabil olması için bekle

            expected = i * j;

            if (Prod !== expected) begin
                $display("ERROR: %d x %d = %d (Got %d)", i, j, expected, Prod);
            end else begin
                $display("PASS: %d x %d = %d", i, j, Prod);
            end
        end
    end
    $display("All tests completed.");
    $stop;
end

endmodule
