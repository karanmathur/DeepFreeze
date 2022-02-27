
module sram_array_k3
#(
    parameter KER_SIZE = 3,
    parameter DW       = 32, // Data width (nbits)
    parameter NW       = 32, // Number of words
    parameter AW       = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write    
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1;

always_ff @(posedge clk) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb begin
    case (1'b1)
        write_en_D1[0] : q = {q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW]};
        write_en_D1[1] : q = {q_wire[DW-1:0],q_wire[3*DW-1:2*DW]};
        write_en_D1[2] : q = {q_wire[2*DW-1:DW],q_wire[DW-1:0]};
        default :        q = '0;
    endcase
end

endmodule

module sram_array_k5
#(
    parameter KER_SIZE = 5,
    parameter DW = 32, // Data width (nbits)
    parameter NW = 32, // Number of words
    parameter AW = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write    
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1; // delayed write enable because of 1 cycle delay of sram

always_ff @(posedge clk) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb begin
    case (1'b1)
        write_en_D1[0] : q = {q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW]};
        write_en_D1[1] : q = {q_wire[DW-1:0],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW]};
        write_en_D1[2] : q = {q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW]};
        write_en_D1[3] : q = {q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:DW],q_wire[5*DW-1:4*DW]};
        write_en_D1[4] : q = {q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0]};
        default :        q = '0;
    endcase
end

endmodule

module sram_array_k7
#(
    parameter KER_SIZE = 7,
    parameter DW = 32, // Data width (nbits)
    parameter NW = 32, // Number of words
    parameter AW = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write    
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1; // delayed write enable because of 1 cycle delay of sram

always_ff @(posedge clk) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb begin
    case (1'b1) 
        write_en_D1[0] : q = {q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW]};
        write_en_D1[1] : q = {q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW]};
        write_en_D1[2] : q = {q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW]};
        write_en_D1[3] : q = {q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW]};
        write_en_D1[4] : q = {q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW],q_wire[6*DW-1:5*DW]};
        write_en_D1[5] : q = {q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0],q_wire[7*DW-1:6*DW]};
        write_en_D1[6] : q = {q_wire[6*DW-1:5*DW],q_wire[5*DW-1:4*DW],q_wire[4*DW-1:3*DW],q_wire[3*DW-1:2*DW],q_wire[2*DW-1:DW],q_wire[DW-1:0]};
        default :        q = '0;
    endcase
end

endmodule

module sram_array_k2
#(
    parameter KER_SIZE = 3,
    parameter DW = 32, // Data width (nbits)
    parameter NW = 32, // Number of words
    parameter AW = $clog2(NW)
)
(
    input logic clk,
    input logic rstn,
    input logic [AW-1:0] a, // same for read and write
    input logic [KER_SIZE-1:0] wen, // active high
    input logic [KER_SIZE-1:0] ren, // active high
    input logic [DW-1:0] d,
    output logic [(KER_SIZE-1)*DW-1:0] q
);

//logic [DW-1:0] q_wire [KER_SIZE-1:0];
logic [KER_SIZE*DW-1:0] q_wire; 

logic [KER_SIZE-1:0] write_en_D1;

always_ff @(posedge clk ) begin
    if(!rstn) begin
        write_en_D1 <= '0;
    end
    else begin
        write_en_D1 <= wen;
    end
end

genvar i;
generate
    for (i = 0; i < (KER_SIZE); i++) begin
        array #(
            .DW (DW),
            .NW (NW),
            .AW (AW)
        ) sram_inst (
            .clk (clk),
            .cen (!(wen[i] || ren[i])),
            .gwen (!(wen[i])),
            .a (a),
            .d (d),
            .q (q_wire[(i+1)*DW-1:i*DW])
        );
    end
endgenerate

// reorder rows
always_comb
begin
    case (1'b1)
        write_en_D1[0] : q = {q_wire[1]};
        write_en_D1[1] : q = {q_wire[0]};
        default :        q = '0;
    endcase
end

endmodule

module array
#(
    parameter DW = 32,
    parameter NW = 32,
    parameter AW = $clog2(NW) 
) 
(
    input logic clk,
    input logic cen, // enable active low
    input logic gwen, // global write enable active low
    input logic [AW-1:0] a,
    input logic [DW-1:0] d,
    output logic [DW-1:0] q
);

logic [DW-1:0] data [0:NW-1];

// write
always @(posedge clk) begin
    if (~cen & ~gwen) begin
        data[a] <= d;
    end
    else begin
        data[a] <= data[a];
    end
end

// read
always @(posedge clk) begin
    if (~cen) begin
        q <= data[a];
    end
    else begin
        q <= q;
    end
end

endmodule

module ram_single #(parameter WORDS = 256, parameter A_WIDTH =8, parameter D_WIDTH=12) (q, address, d, we, clk);
   output logic [D_WIDTH-1:0] q;
   input [D_WIDTH-1:0] d;
   input [A_WIDTH:0] address;
   input we, clk;
   reg [D_WIDTH-1:0] mem [WORDS-1:0];
    always @(posedge clk) begin
        if (we)
            mem[address] <= d;
        q <= mem[address];
   end
endmodule



