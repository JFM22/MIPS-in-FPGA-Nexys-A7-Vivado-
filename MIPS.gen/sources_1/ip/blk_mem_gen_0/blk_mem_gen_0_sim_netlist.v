// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Jan 11 14:07:57 2025
// Host        : Javi running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/javic/Downloads/MIPS/MIPS.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.9043 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_8 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28752)
`pragma protect data_block
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
3+xl8Te0heDjuJ06EuKUj3eKtCbcbnWP
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
