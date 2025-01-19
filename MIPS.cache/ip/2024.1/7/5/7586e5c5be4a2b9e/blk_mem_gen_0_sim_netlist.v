// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Jan 11 14:07:57 2025
// Host        : Javi running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_8 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28784)
`pragma protect data_block
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
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
