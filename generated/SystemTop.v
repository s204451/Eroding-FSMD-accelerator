module DataMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_dataRead,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_1_en; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_3_en; // @[DataMemory.scala 18:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 27:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 37:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 26:17 DataMemory.scala 34:17 DataMemory.scala 40:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 24:23 DataMemory.scala 30:25 DataMemory.scala 36:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:20]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:20]
    end
  end
endmodule
module Accelerator(
  input         clock,
  input         reset,
  input         io_start,
  output        io_done,
  output [15:0] io_address,
  input  [31:0] io_dataRead,
  output        io_writeEnable,
  output [31:0] io_dataWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stateReg; // @[Accelerator.scala 19:25]
  reg [4:0] xReg; // @[Accelerator.scala 22:21]
  reg [4:0] yReg; // @[Accelerator.scala 23:21]
  wire  _T = 4'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _T_2 = 5'h14 * yReg; // @[Accelerator.scala 41:33]
  wire [9:0] _GEN_78 = {{5'd0}, xReg}; // @[Accelerator.scala 41:26]
  wire [9:0] _T_4 = _GEN_78 + _T_2; // @[Accelerator.scala 41:26]
  wire  _T_5 = xReg == 5'h14; // @[Accelerator.scala 42:18]
  wire  _T_6 = yReg == 5'h14; // @[Accelerator.scala 44:24]
  wire [4:0] _T_8 = xReg + 5'h1; // @[Accelerator.scala 45:22]
  wire  _T_9 = xReg <= 5'h13; // @[Accelerator.scala 48:24]
  wire  _T_10 = yReg <= 5'h13; // @[Accelerator.scala 49:24]
  wire  _T_11 = _T_9 & _T_10; // @[Accelerator.scala 48:32]
  wire  _T_12 = yReg == 5'h0; // @[Accelerator.scala 50:25]
  wire  _T_13 = yReg == 5'h13; // @[Accelerator.scala 50:41]
  wire  _T_14 = _T_12 | _T_13; // @[Accelerator.scala 50:33]
  wire  _T_15 = xReg == 5'h0; // @[Accelerator.scala 50:58]
  wire  _T_16 = _T_14 | _T_15; // @[Accelerator.scala 50:50]
  wire  _T_17 = xReg == 5'h13; // @[Accelerator.scala 50:74]
  wire  _T_18 = _T_16 | _T_17; // @[Accelerator.scala 50:66]
  wire  _T_19 = _T_11 & _T_18; // @[Accelerator.scala 49:32]
  wire  _T_20 = io_dataRead == 32'h0; // @[Accelerator.scala 52:32]
  wire  _T_21 = 4'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _T_26 = _T_4 + 10'h190; // @[Accelerator.scala 60:40]
  wire [4:0] _T_28 = yReg + 5'h1; // @[Accelerator.scala 63:20]
  wire  _T_29 = 4'h3 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_37 = 4'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _T_42 = _T_4 - 10'h1; // @[Accelerator.scala 75:40]
  wire  _T_44 = 4'h5 == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _T_49 = _T_4 + 10'h1; // @[Accelerator.scala 83:40]
  wire  _T_51 = 4'h6 == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _T_56 = _T_4 - 10'h14; // @[Accelerator.scala 91:40]
  wire  _T_58 = 4'h7 == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _T_63 = _T_4 + 10'h14; // @[Accelerator.scala 99:40]
  wire  _T_65 = 4'h8 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_73 = 4'h9 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_81 = 4'ha == stateReg; // @[Conditional.scala 37:30]
  wire [9:0] _GEN_16 = _T_73 ? _T_26 : 10'h0; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_73 ? 1'h0 : _T_81; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_22 = _T_65 ? _T_26 : _GEN_16; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_23 = _T_65 ? 8'hff : 8'h0; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_65 | _T_73; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_65 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_28 = _T_58 ? _T_63 : _GEN_22; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_30 = _T_58 ? 8'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_58 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_58 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_34 = _T_51 ? _T_56 : _GEN_28; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_36 = _T_51 ? 8'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_51 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_51 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_40 = _T_44 ? _T_49 : _GEN_34; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_42 = _T_44 ? 8'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_44 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_44 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_46 = _T_37 ? _T_42 : _GEN_40; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_48 = _T_37 ? 8'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_37 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_37 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_52 = _T_29 ? _T_26 : _GEN_46; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_53 = _T_29 ? 8'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_29 | _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_29 ? 1'h0 : _GEN_51; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_58 = _T_21 ? _T_26 : _GEN_52; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_59 = _T_21 ? 8'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_21 | _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_21 ? 1'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_64 = _T_1 ? _T_4 : _GEN_58; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_68 = _T_1 ? 8'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_1 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_1 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_73 = _T ? 10'h0 : _GEN_64; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_75 = _T ? 8'h0 : _GEN_68; // @[Conditional.scala 40:58]
  assign io_done = _T ? 1'h0 : _GEN_70; // @[Accelerator.scala 28:11 Accelerator.scala 121:15]
  assign io_address = {{6'd0}, _GEN_73}; // @[Accelerator.scala 26:14 Accelerator.scala 41:18 Accelerator.scala 60:18 Accelerator.scala 67:18 Accelerator.scala 75:18 Accelerator.scala 83:18 Accelerator.scala 91:18 Accelerator.scala 99:18 Accelerator.scala 107:18 Accelerator.scala 114:18]
  assign io_writeEnable = _T ? 1'h0 : _GEN_69; // @[Accelerator.scala 27:18 Accelerator.scala 62:22 Accelerator.scala 69:22 Accelerator.scala 109:22 Accelerator.scala 116:22]
  assign io_dataWrite = {{24'd0}, _GEN_75}; // @[Accelerator.scala 29:16 Accelerator.scala 61:20 Accelerator.scala 68:20 Accelerator.scala 108:20 Accelerator.scala 115:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  xReg = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  yReg = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      stateReg <= 4'h0;
    end else if (_T) begin
      if (io_start) begin
        stateReg <= 4'h1;
      end
    end else if (_T_1) begin
      if (_T_5) begin
        stateReg <= 4'ha;
      end else if (_T_6) begin
        stateReg <= 4'h1;
      end else if (_T_19) begin
        stateReg <= 4'h9;
      end else if (_T_20) begin
        stateReg <= 4'h2;
      end else begin
        stateReg <= 4'h4;
      end
    end else if (_T_21) begin
      stateReg <= 4'h3;
    end else if (_T_29) begin
      stateReg <= 4'h1;
    end else if (_T_37) begin
      if (_T_20) begin
        stateReg <= 4'h9;
      end else begin
        stateReg <= 4'h5;
      end
    end else if (_T_44) begin
      if (_T_20) begin
        stateReg <= 4'h9;
      end else begin
        stateReg <= 4'h6;
      end
    end else if (_T_51) begin
      if (_T_20) begin
        stateReg <= 4'h9;
      end else begin
        stateReg <= 4'h7;
      end
    end else if (_T_58) begin
      if (_T_20) begin
        stateReg <= 4'h9;
      end else begin
        stateReg <= 4'h8;
      end
    end else if (_T_65) begin
      stateReg <= 4'h1;
    end else if (_T_73) begin
      stateReg <= 4'h1;
    end else if (_T_81) begin
      stateReg <= 4'ha;
    end
    if (reset) begin
      xReg <= 5'h0;
    end else if (_T) begin
      if (io_start) begin
        xReg <= 5'h0;
      end
    end else if (_T_1) begin
      if (!(_T_5)) begin
        if (_T_6) begin
          xReg <= _T_8;
        end
      end
    end
    if (reset) begin
      yReg <= 5'h0;
    end else if (!(_T)) begin
      if (_T_1) begin
        if (!(_T_5)) begin
          if (_T_6) begin
            yReg <= 5'h0;
          end
        end
      end else if (_T_21) begin
        yReg <= _T_28;
      end else if (_T_29) begin
        yReg <= _T_28;
      end else if (!(_T_37)) begin
        if (!(_T_44)) begin
          if (!(_T_51)) begin
            if (!(_T_58)) begin
              if (_T_65) begin
                yReg <= _T_28;
              end else if (_T_73) begin
                yReg <= _T_28;
              end
            end
          end
        end
      end
    end
  end
endmodule
module SystemTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_start,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite
);
  wire  dataMemory_clock; // @[SystemTop.scala 18:26]
  wire [15:0] dataMemory_io_address; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_dataRead; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_writeEnable; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_dataWrite; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_testerEnable; // @[SystemTop.scala 18:26]
  wire [15:0] dataMemory_io_testerAddress; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_testerWriteEnable; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[SystemTop.scala 18:26]
  wire  accelerator_clock; // @[SystemTop.scala 19:27]
  wire  accelerator_reset; // @[SystemTop.scala 19:27]
  wire  accelerator_io_start; // @[SystemTop.scala 19:27]
  wire  accelerator_io_done; // @[SystemTop.scala 19:27]
  wire [15:0] accelerator_io_address; // @[SystemTop.scala 19:27]
  wire [31:0] accelerator_io_dataRead; // @[SystemTop.scala 19:27]
  wire  accelerator_io_writeEnable; // @[SystemTop.scala 19:27]
  wire [31:0] accelerator_io_dataWrite; // @[SystemTop.scala 19:27]
  DataMemory dataMemory ( // @[SystemTop.scala 18:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_dataRead(dataMemory_io_dataRead),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  Accelerator accelerator ( // @[SystemTop.scala 19:27]
    .clock(accelerator_clock),
    .reset(accelerator_reset),
    .io_start(accelerator_io_start),
    .io_done(accelerator_io_done),
    .io_address(accelerator_io_address),
    .io_dataRead(accelerator_io_dataRead),
    .io_writeEnable(accelerator_io_writeEnable),
    .io_dataWrite(accelerator_io_dataWrite)
  );
  assign io_done = accelerator_io_done; // @[SystemTop.scala 23:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[SystemTop.scala 34:28]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = accelerator_io_address; // @[SystemTop.scala 28:25]
  assign dataMemory_io_writeEnable = accelerator_io_writeEnable; // @[SystemTop.scala 30:29]
  assign dataMemory_io_dataWrite = accelerator_io_dataWrite; // @[SystemTop.scala 29:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[SystemTop.scala 36:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[SystemTop.scala 33:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[SystemTop.scala 37:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[SystemTop.scala 35:33]
  assign accelerator_clock = clock;
  assign accelerator_reset = reset;
  assign accelerator_io_start = io_start; // @[SystemTop.scala 24:24]
  assign accelerator_io_dataRead = dataMemory_io_dataRead; // @[SystemTop.scala 27:27]
endmodule
