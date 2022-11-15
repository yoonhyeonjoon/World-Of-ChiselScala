
module mainbus_subsystem (
	 output         CLK__DDR1__SRC__MAINPLL1
	,output         CLK__DDR1__SRC__MAINPLL0
	,output         CLK__DDR1__SRC__OSC
	,output         CLK__DDR0__SRC__MAINPLL1
	,output         CLK__DDR0__SRC__MAINPLL0
	,output         CLK__DDR0__SRC__OSC
	,output         CLK__USB3__SRC__MAINPLL1
	,output         CLK__USB3__SRC__MAINPLL0
	,output         CLK__USB3__SRC__OSC
	,output         CLK__KETI__SRC__MAINPLL1
	,output         CLK__KETI__SRC__MAINPLL0
	,output         CLK__KETI__SRC__OSC
	,output         CLK__CBU__SRC__MAINPLL1
	,output         CLK__CBU__SRC__MAINPLL0
	,output         CLK__CBU__SRC__OSC
	,output         CLK__PERI__SRC__MAINPLL1
	,output         CLK__PERI__SRC__MAINPLL0
	,output         CLK__PERI__SRC__OSC
	,output         CLK__ETHERNET__SRC__MAINPLL1
	,output         CLK__ETHERNET__SRC__MAINPLL0
	,output         CLK__ETHERNET__SRC__OSC
	,output         CLK__EMMC__SRC__MAINPLL1
	,output         CLK__EMMC__SRC__MAINPLL0
	,output         CLK__EMMC__SRC__OSC
	,output         CLK__SDHC__SRC__MAINPLL1
	,output         CLK__SDHC__SRC__MAINPLL0
	,output         CLK__SDHC__SRC__OSC
	,output         CLK__CAMERA__SRC__MAINPLL1
	,output         CLK__CAMERA__SRC__MAINPLL0
	,output         CLK__CAMERA__SRC__OSC
	,output         CLK__CPU__SRC__OSC
	,output         RST__DDR1__SRC__OSC
	,output         RST__DDR0__SRC__OSC
	,output         RST__USB3__SRC__OSC
	,output         RST__KETI__SRC__OSC
	,output         RST__CBU__SRC__OSC
	,output         RST__PERI__SRC__OSC
	,output         RST__ETHERNET__SRC__OSC
	,output         RST__EMMC__SRC__OSC
	,output         RST__SDHC__SRC__OSC
	,output         RST__CAMERA__SRC__OSC
	,output         RST__CPU__SRC__OSC
	,input          CLK__SRC__MAINPLL1
	,input          CLK__SRC__MAINPLL0
	,input          I_BIST_MODE
	,input          DFT__PLL_MAIN_1_MODE
	,input          DFT__PLL_MAIN_0_MODE
	,input  [ 52:0] DFT__PLL_MAIN_1_IN
	,input  [ 52:0] DFT__PLL_MAIN_0_IN
	,output [  7:0] DFT__PLL_MAIN_1_OUT
	,output [  7:0] DFT__PLL_MAIN_0_OUT
	,input          MAINBUS_0__DFT_SCAN_MODE
	,output [157:0] ASYNC__CAMERA_CBUS__MST
	,input  [ 45:0] ASYNC__CAMERA_CBUS__SLV
	,input          CLK__CAMERA_CBUS__SLV
	,output         CLK__CAMERA_CBUS__MST
	,input          I_TEST_MODE_RESETN
	,output [157:0] ASYNC__ETHER_CBUS__MST
	,input  [ 45:0] ASYNC__ETHER_CBUS__SLV
	,input          CLK__ETHER_CBUS__SLV
	,output         CLK__ETHER_CBUS__MST
	,output [157:0] ASYNC__PERI_CBUS__MST
	,input  [ 45:0] ASYNC__PERI_CBUS__SLV
	,input          CLK__PERI_CBUS__SLV
	,output         CLK__PERI_CBUS__MST
	,output [157:0] ASYNC__USB3_CBUS__MST
	,input  [ 45:0] ASYNC__USB3_CBUS__SLV
	,input          CLK__USB3_CBUS__SLV
	,output         CLK__USB3_CBUS__MST
	,output [157:0] ASYNC__KETI_CBUS__MST
	,input  [ 45:0] ASYNC__KETI_CBUS__SLV
	,input          CLK__KETI_CBUS__SLV
	,output         CLK__KETI_CBUS__MST
	,output [205:0] ASYNC__CPU_FBUS__MST
	,input  [ 89:0] ASYNC__CPU_FBUS__SLV
	,input          CLK__CPU_FBUS__SLV
	,output         CLK__CPU_FBUS__MST
	,output [157:0] ASYNC__CBU_CBUS__MST
	,input  [ 45:0] ASYNC__CBU_CBUS__SLV
	,input          CLK__CBU_CBUS__SLV
	,output         CLK__CBU_CBUS__MST
	,output [157:0] ASYNC__DDR0_CBUS__MST
	,input  [ 45:0] ASYNC__DDR0_CBUS__SLV
	,input          CLK__DDR0_CBUS__SLV
	,output         CLK__DDR0_CBUS__MST
	,output [435:0] ASYNC__DDR0_DBUS__MST
	,input  [287:0] ASYNC__DDR0_DBUS__SLV
	,input          CLK__DDR0_DBUS__SLV
	,output         CLK__DDR0_DBUS__MST
	,output [157:0] ASYNC__DDR1_CBUS__MST
	,input  [ 45:0] ASYNC__DDR1_CBUS__SLV
	,input          CLK__DDR1_CBUS__SLV
	,output         CLK__DDR1_CBUS__MST
	,output [435:0] ASYNC__DDR1_DBUS__MST
	,input  [287:0] ASYNC__DDR1_DBUS__SLV
	,input          CLK__DDR1_DBUS__SLV
	,output         CLK__DDR1_DBUS__MST
	,output [157:0] ASYNC__SD_CBUS__MST
	,input  [ 45:0] ASYNC__SD_CBUS__SLV
	,input          CLK__SD_CBUS__SLV
	,output         CLK__SD_CBUS__MST
	,output [157:0] ASYNC__EMMC_CBUS__MST
	,input  [ 45:0] ASYNC__EMMC_CBUS__SLV
	,input          CLK__EMMC_CBUS__SLV
	,output         CLK__EMMC_CBUS__MST
	,output [147:0] ASYNC__CAMERA_DBUS__SLV
	,input  [279:0] ASYNC__CAMERA_DBUS__MST
	,input          CLK__CAMERA_DBUS__MST
	,output         CLK__CAMERA_DBUS__SLV
	,output [ 83:0] ASYNC__ETHER_DBUS__SLV
	,input  [207:0] ASYNC__ETHER_DBUS__MST
	,input          CLK__ETHER_DBUS__MST
	,output         CLK__ETHER_DBUS__SLV
	,output [ 85:0] ASYNC__PERI_DBUS__SLV
	,input  [209:0] ASYNC__PERI_DBUS__MST
	,input          CLK__PERI_DBUS__MST
	,output         CLK__PERI_DBUS__SLV
	,output [ 83:0] ASYNC__USB3_DBUS__SLV
	,input  [207:0] ASYNC__USB3_DBUS__MST
	,input          CLK__USB3_DBUS__MST
	,output         CLK__USB3_DBUS__SLV
	,output [277:0] ASYNC__KETI_DBUS0__SLV
	,input  [425:0] ASYNC__KETI_DBUS0__MST
	,input          CLK__KETI_DBUS0__MST
	,output         CLK__KETI_DBUS0__SLV
	,output [277:0] ASYNC__KETI_DBUS1__SLV
	,input  [425:0] ASYNC__KETI_DBUS1__MST
	,input          CLK__KETI_DBUS1__MST
	,output         CLK__KETI_DBUS1__SLV
	,output [277:0] ASYNC__KETI_DBUS2__SLV
	,input  [425:0] ASYNC__KETI_DBUS2__MST
	,input          CLK__KETI_DBUS2__MST
	,output         CLK__KETI_DBUS2__SLV
	,output [ 45:0] ASYNC__CPU_CBUS__SLV
	,input  [157:0] ASYNC__CPU_CBUS__MST
	,input          CLK__CPU_CBUS__MST
	,output         CLK__CPU_CBUS__SLV
	,output [157:0] ASYNC__CPU_DBUS__SLV
	,input  [289:0] ASYNC__CPU_DBUS__MST
	,input          CLK__CPU_DBUS__MST
	,output         CLK__CPU_DBUS__SLV
	,output [269:0] ASYNC__CBU_DBUS__SLV
	,input  [417:0] ASYNC__CBU_DBUS__MST
	,input          CLK__CBU_DBUS__MST
	,output         CLK__CBU_DBUS__SLV
	,output [ 77:0] ASYNC__SD_DBUS__SLV
	,input  [201:0] ASYNC__SD_DBUS__MST
	,input          CLK__SD_DBUS__MST
	,output         CLK__SD_DBUS__SLV
	,output [ 77:0] ASYNC__EMMC_DBUS__SLV
	,input  [201:0] ASYNC__EMMC_DBUS__MST
	,input          CLK__EMMC_DBUS__MST
	,output         CLK__EMMC_DBUS__SLV
	,input          IO_PAD__PORN__Y
	,input          I_TEST_MODE
	,input          IO_PAD__ERESETN__Y
	,input  [  5:0] IO_PAD__BOOTMODE__Y
	,input          CLK__SRC__OSC
	,input          WDT_0__RSTREQN
	,output         RSTN__COLDRESET
	,input          IO_PAD__TRSTN
	,input          IO_PAD__TCLTK
	,output [  5:0] PATCHED__BOOT_MODE
	,input          RSTN__DEBUG_NDRESET
	,output         CPU_0__RSTN__JTAG
	,output         CPU_0__CLK__JTAG
	,output         POR_0__DFT__SYS_OUT
	,output         IO_PAD__RSTNOUT__A
);
`ifdef SEMIFIVE_MAKE_TRUE_BLACKBOX_mainbus_subsystem
`ifndef SYNTHESIS
    Error_SEMIFIVE_MAKE_BLACKBOX_FOR_TOP_SYNTHESIS_implementation ERROR_0();
`endif
`elsif SEMIFIVE_MAKE_BLACKBOX_mainbus_subsystem
	assign CLK__DDR1__SRC__MAINPLL1 = 1'h0;
	assign CLK__DDR1__SRC__MAINPLL0 = 1'h0;
	assign CLK__DDR1__SRC__OSC = 1'h0;
	assign CLK__DDR0__SRC__MAINPLL1 = 1'h0;
	assign CLK__DDR0__SRC__MAINPLL0 = 1'h0;
	assign CLK__DDR0__SRC__OSC = 1'h0;
	assign CLK__USB3__SRC__MAINPLL1 = 1'h0;
	assign CLK__USB3__SRC__MAINPLL0 = 1'h0;
	assign CLK__USB3__SRC__OSC = 1'h0;
	assign CLK__KETI__SRC__MAINPLL1 = 1'h0;
	assign CLK__KETI__SRC__MAINPLL0 = 1'h0;
	assign CLK__KETI__SRC__OSC = 1'h0;
	assign CLK__CBU__SRC__MAINPLL1 = 1'h0;
	assign CLK__CBU__SRC__MAINPLL0 = 1'h0;
	assign CLK__CBU__SRC__OSC = 1'h0;
	assign CLK__PERI__SRC__MAINPLL1 = 1'h0;
	assign CLK__PERI__SRC__MAINPLL0 = 1'h0;
	assign CLK__PERI__SRC__OSC = 1'h0;
	assign CLK__ETHERNET__SRC__MAINPLL1 = 1'h0;
	assign CLK__ETHERNET__SRC__MAINPLL0 = 1'h0;
	assign CLK__ETHERNET__SRC__OSC = 1'h0;
	assign CLK__EMMC__SRC__MAINPLL1 = 1'h0;
	assign CLK__EMMC__SRC__MAINPLL0 = 1'h0;
	assign CLK__EMMC__SRC__OSC = 1'h0;
	assign CLK__SDHC__SRC__MAINPLL1 = 1'h0;
	assign CLK__SDHC__SRC__MAINPLL0 = 1'h0;
	assign CLK__SDHC__SRC__OSC = 1'h0;
	assign CLK__CAMERA__SRC__MAINPLL1 = 1'h0;
	assign CLK__CAMERA__SRC__MAINPLL0 = 1'h0;
	assign CLK__CAMERA__SRC__OSC = 1'h0;
	assign CLK__CPU__SRC__OSC = 1'h0;
	assign RST__DDR1__SRC__OSC = 1'h0;
	assign RST__DDR0__SRC__OSC = 1'h0;
	assign RST__USB3__SRC__OSC = 1'h0;
	assign RST__KETI__SRC__OSC = 1'h0;
	assign RST__CBU__SRC__OSC = 1'h0;
	assign RST__PERI__SRC__OSC = 1'h0;
	assign RST__ETHERNET__SRC__OSC = 1'h0;
	assign RST__EMMC__SRC__OSC = 1'h0;
	assign RST__SDHC__SRC__OSC = 1'h0;
	assign RST__CAMERA__SRC__OSC = 1'h0;
	assign RST__CPU__SRC__OSC = 1'h0;
	assign DFT__PLL_MAIN_1_OUT = 8'h0;
	assign DFT__PLL_MAIN_0_OUT = 8'h0;
	assign ASYNC__CAMERA_CBUS__MST = 158'h0;
	assign CLK__CAMERA_CBUS__MST = 1'h0;
	assign ASYNC__ETHER_CBUS__MST = 158'h0;
	assign CLK__ETHER_CBUS__MST = 1'h0;
	assign ASYNC__PERI_CBUS__MST = 158'h0;
	assign CLK__PERI_CBUS__MST = 1'h0;
	assign ASYNC__USB3_CBUS__MST = 158'h0;
	assign CLK__USB3_CBUS__MST = 1'h0;
	assign ASYNC__KETI_CBUS__MST = 158'h0;
	assign CLK__KETI_CBUS__MST = 1'h0;
	assign ASYNC__CPU_FBUS__MST = 206'h0;
	assign CLK__CPU_FBUS__MST = 1'h0;
	assign ASYNC__CBU_CBUS__MST = 158'h0;
	assign CLK__CBU_CBUS__MST = 1'h0;
	assign ASYNC__DDR0_CBUS__MST = 158'h0;
	assign CLK__DDR0_CBUS__MST = 1'h0;
	assign ASYNC__DDR0_DBUS__MST = 436'h0;
	assign CLK__DDR0_DBUS__MST = 1'h0;
	assign ASYNC__DDR1_CBUS__MST = 158'h0;
	assign CLK__DDR1_CBUS__MST = 1'h0;
	assign ASYNC__DDR1_DBUS__MST = 436'h0;
	assign CLK__DDR1_DBUS__MST = 1'h0;
	assign ASYNC__SD_CBUS__MST = 158'h0;
	assign CLK__SD_CBUS__MST = 1'h0;
	assign ASYNC__EMMC_CBUS__MST = 158'h0;
	assign CLK__EMMC_CBUS__MST = 1'h0;
	assign ASYNC__CAMERA_DBUS__SLV = 148'h0;
	assign CLK__CAMERA_DBUS__SLV = 1'h0;
	assign ASYNC__ETHER_DBUS__SLV = 84'h0;
	assign CLK__ETHER_DBUS__SLV = 1'h0;
	assign ASYNC__PERI_DBUS__SLV = 86'h0;
	assign CLK__PERI_DBUS__SLV = 1'h0;
	assign ASYNC__USB3_DBUS__SLV = 84'h0;
	assign CLK__USB3_DBUS__SLV = 1'h0;
	assign ASYNC__KETI_DBUS0__SLV = 278'h0;
	assign CLK__KETI_DBUS0__SLV = 1'h0;
	assign ASYNC__KETI_DBUS1__SLV = 278'h0;
	assign CLK__KETI_DBUS1__SLV = 1'h0;
	assign ASYNC__KETI_DBUS2__SLV = 278'h0;
	assign CLK__KETI_DBUS2__SLV = 1'h0;
	assign ASYNC__CPU_CBUS__SLV = 46'h0;
	assign CLK__CPU_CBUS__SLV = 1'h0;
	assign ASYNC__CPU_DBUS__SLV = 158'h0;
	assign CLK__CPU_DBUS__SLV = 1'h0;
	assign ASYNC__CBU_DBUS__SLV = 270'h0;
	assign CLK__CBU_DBUS__SLV = 1'h0;
	assign ASYNC__SD_DBUS__SLV = 78'h0;
	assign CLK__SD_DBUS__SLV = 1'h0;
	assign ASYNC__EMMC_DBUS__SLV = 78'h0;
	assign CLK__EMMC_DBUS__SLV = 1'h0;
	assign RSTN__COLDRESET = 1'h0;
	assign PATCHED__BOOT_MODE = 6'h0;
	assign CPU_0__RSTN__JTAG = 1'h0;
	assign CPU_0__CLK__JTAG = 1'h0;
	assign POR_0__DFT__SYS_OUT = 1'h0;
	assign IO_PAD__RSTNOUT__A = 1'h0;
`else // SEMIFIVE_MAKE_BLACKBOX_mainbus_subsystem
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_ready;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_valid;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_ready;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_valid;
	wire [ 31:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_data;
	wire [  3:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_last;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_ready;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_valid;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_ready;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_valid;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_ready;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_valid;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_id;
	wire [ 31:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_last;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_ready;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_valid;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_ready;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_valid;
	wire [ 31:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_data;
	wire [  3:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_last;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_ready;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_valid;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_ready;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_valid;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_ready;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_valid;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_id;
	wire [ 31:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_last;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_ready;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_valid;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_ready;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_valid;
	wire [ 31:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_data;
	wire [  3:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_last;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_ready;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_valid;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_ready;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_valid;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_ready;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_valid;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_id;
	wire [ 31:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_last;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_ready;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_valid;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_ready;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_valid;
	wire [ 31:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_data;
	wire [  3:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_last;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_ready;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_valid;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_ready;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_valid;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_ready;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_valid;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_id;
	wire [ 31:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_last;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_ready;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_valid;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_burst;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_ready;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_valid;
	wire [ 31:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_data;
	wire [  3:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_last;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_ready;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_valid;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_ready;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_valid;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_burst;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_ready;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_valid;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_id;
	wire [ 31:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_last;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_ready;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_valid;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_burst;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_ready;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_valid;
	wire [ 31:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_data;
	wire [  3:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_last;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_ready;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_valid;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_ready;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_valid;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_burst;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_ready;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_valid;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_id;
	wire [ 31:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_last;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_ready;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_valid;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_ready;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_valid;
	wire [ 31:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_data;
	wire [  3:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_last;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_ready;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_valid;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_ready;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_valid;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_ready;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_valid;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_id;
	wire [ 31:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_last;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_ready;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_valid;
	wire [  6:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_burst;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_ready;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_valid;
	wire [ 63:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_data;
	wire [  7:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_last;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_ready;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_valid;
	wire [  6:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_ready;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_valid;
	wire [  6:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_burst;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_ready;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_valid;
	wire [  6:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_id;
	wire [ 63:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_last;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_ready;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_valid;
	wire [  3:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_ready;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_valid;
	wire [ 63:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_data;
	wire [  7:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_last;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_ready;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_valid;
	wire [  3:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_ready;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_valid;
	wire [  3:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_ready;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_valid;
	wire [  3:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_id;
	wire [ 63:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_last;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_ready;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_valid;
	wire [  4:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_ready;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_valid;
	wire [ 63:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_data;
	wire [  7:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_last;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_ready;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_valid;
	wire [  4:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_ready;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_valid;
	wire [  4:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_ready;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_valid;
	wire [  4:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_id;
	wire [ 63:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_last;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_ready;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_valid;
	wire [  3:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_ready;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_valid;
	wire [ 63:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_data;
	wire [  7:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_last;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_ready;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_valid;
	wire [  3:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_ready;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_valid;
	wire [  3:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_ready;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_valid;
	wire [  3:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_id;
	wire [ 63:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_last;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_ready;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_valid;
	wire [  8:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_burst;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_prot;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_ready;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_valid;
	wire [127:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_data;
	wire [ 15:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_strb;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_last;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_ready;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_valid;
	wire [  8:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_resp;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_ready;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_valid;
	wire [  8:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_burst;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_prot;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_ready;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_valid;
	wire [  8:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_id;
	wire [127:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_resp;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_last;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_ready;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_valid;
	wire [  3:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_burst;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_prot;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_ready;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_valid;
	wire [127:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_data;
	wire [ 15:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_strb;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_last;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_ready;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_valid;
	wire [  3:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_resp;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_ready;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_valid;
	wire [  3:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_burst;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_prot;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_ready;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_valid;
	wire [  3:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_id;
	wire [127:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_resp;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_last;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_ready;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_lock;
	wire [  2:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_ready;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_valid;
	wire [255:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_data;
	wire [ 31:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_last;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_ready;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_ready;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_lock;
	wire [  2:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_ready;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_id;
	wire [255:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_last;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_ready;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_lock;
	wire [  2:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_ready;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_valid;
	wire [255:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_data;
	wire [ 31:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_last;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_ready;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_ready;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_lock;
	wire [  2:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_ready;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_id;
	wire [255:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_last;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_ready;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_valid;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_lock;
	wire [  2:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_ready;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_valid;
	wire [255:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_data;
	wire [ 31:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_last;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_ready;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_valid;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_ready;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_valid;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_lock;
	wire [  2:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_ready;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_valid;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_id;
	wire [255:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_last;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_ready;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_burst;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_lock;
	wire [  2:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_prot;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_ready;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_valid;
	wire [255:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_data;
	wire [ 31:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_strb;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_last;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_ready;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_id;
	wire [  1:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_resp;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_ready;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_len;
	wire [  2:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_size;
	wire [  1:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_burst;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_lock;
	wire [  2:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_prot;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_ready;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_valid;
	wire [  4:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_id;
	wire [255:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_data;
	wire [  1:0] mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_resp;
	wire         mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_last;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_ready;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_valid;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_len;
	wire [  2:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_size;
	wire [  1:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_prot;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_ready;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_valid;
	wire [ 31:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_data;
	wire [  3:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_strb;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_last;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_ready;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_valid;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_bits_id;
	wire [  1:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_bits_resp;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_ready;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_valid;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_len;
	wire [  2:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_size;
	wire [  1:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_prot;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_ready;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_valid;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_id;
	wire [ 31:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_data;
	wire [  1:0] mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_resp;
	wire         mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_last;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_ready;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_valid;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_len;
	wire [  2:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_size;
	wire [  1:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_prot;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_ready;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_valid;
	wire [ 31:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_data;
	wire [  3:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_strb;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_last;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_ready;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_valid;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_bits_id;
	wire [  1:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_bits_resp;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_ready;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_valid;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_len;
	wire [  2:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_size;
	wire [  1:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_prot;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_ready;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_valid;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_id;
	wire [ 31:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_data;
	wire [  1:0] mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_resp;
	wire         mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_last;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_ready;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_valid;
	wire [  9:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_burst;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_lock;
	wire [  2:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_ready;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_valid;
	wire [255:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_data;
	wire [ 31:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_last;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_ready;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_valid;
	wire [  9:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_ready;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_valid;
	wire [  9:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_burst;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_lock;
	wire [  2:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_ready;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_valid;
	wire [  9:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_id;
	wire [255:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_last;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_ready;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_valid;
	wire [  9:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_id;
	wire [ 35:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_len;
	wire [  2:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_size;
	wire [  1:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_burst;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_lock;
	wire [  2:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_prot;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_ready;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_valid;
	wire [255:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_data;
	wire [ 31:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_strb;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_last;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_ready;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_valid;
	wire [  9:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_id;
	wire [  1:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_resp;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_ready;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_valid;
	wire [  9:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_id;
	wire [ 35:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_len;
	wire [  2:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_size;
	wire [  1:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_burst;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_lock;
	wire [  2:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_prot;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_ready;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_valid;
	wire [  9:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_id;
	wire [255:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_data;
	wire [  1:0] mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_resp;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_last;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_ready;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_valid;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_len;
	wire [  2:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_size;
	wire [  1:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_prot;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_ready;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_valid;
	wire [ 31:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_data;
	wire [  3:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_strb;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_last;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_ready;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_valid;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_bits_id;
	wire [  1:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_bits_resp;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_ready;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_valid;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_len;
	wire [  2:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_size;
	wire [  1:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_prot;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_ready;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_valid;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_id;
	wire [ 31:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_data;
	wire [  1:0] mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_resp;
	wire         mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_last;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_ready;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_valid;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_id;
	wire [ 31:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_len;
	wire [  2:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_size;
	wire [  1:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_burst;
	wire [  2:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_prot;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_ready;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_valid;
	wire [ 31:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_data;
	wire [  3:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_strb;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_last;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_ready;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_valid;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_bits_id;
	wire [  1:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_bits_resp;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_ready;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_valid;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_id;
	wire [ 31:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_len;
	wire [  2:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_size;
	wire [  1:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_burst;
	wire [  2:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_prot;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_ready;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_valid;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_id;
	wire [ 31:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_data;
	wire [  1:0] mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_resp;
	wire         mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_last;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_ready;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_valid;
	wire [ 35:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_len;
	wire [  2:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_size;
	wire [  1:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_burst;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_prot;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_ready;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_valid;
	wire [ 63:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_data;
	wire [  7:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_strb;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_last;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_ready;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_valid;
	wire [  1:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_bits_resp;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_ready;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_valid;
	wire [ 35:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_len;
	wire [  2:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_size;
	wire [  1:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_burst;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_prot;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_ready;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_valid;
	wire [ 63:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_data;
	wire [  1:0] mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_resp;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_last;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_ready;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_valid;
	wire [ 35:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_addr;
	wire [  7:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_len;
	wire [  2:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_size;
	wire [  1:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_burst;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_lock;
	wire [  3:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_cache;
	wire [  2:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_prot;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_ready;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_valid;
	wire [ 63:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_data;
	wire [  7:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_strb;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_last;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_ready;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_valid;
	wire [  1:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_bits_resp;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_ready;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_valid;
	wire [ 35:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_addr;
	wire [  7:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_len;
	wire [  2:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_size;
	wire [  1:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_burst;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_lock;
	wire [  3:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_cache;
	wire [  2:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_prot;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_ready;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_valid;
	wire [ 63:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_data;
	wire [  1:0] mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_resp;
	wire         mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_last;
	wire         mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_KETI_DBUS1__auto_AXI4_DBUS1_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_KETI_DBUS2__auto_AXI4_DBUS2_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS4_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_CAMERA_DBUS__auto_AXI4_DBUS4_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS5_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_CPU_DBUS__auto_AXI4_DBUS5_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_DDR0_DBUS__auto_AXI4_DBUS6_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_DDR1_DBUS__auto_AXI4_DBUS7_256_fixedClockNode_out_reset;
	wire         mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_reset;
	wire         mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_reset;
	wire         mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_CPU_FBUS__auto_AXI4_DBUS2_64_fixedClockNode_out_reset;
	wire         mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_fixedClockNode_out_clock;
	wire         mainbus_subsystem__RST_INV_CPU_CBUS__auto_AXI4_CBUS0_32_fixedClockNode_out_reset;
	wire [  2:0] mainbus_subsystem__SystemCRG__auto_RheaMAINBUSSubsystem_SCU_sfrWrapper_custom_bridge_in_1_io;
	wire         RST_INV_CAMERA_CBUS__CAMERA_CBUS__Y;
	wire         RST_INV_ETHER_CBUS__ETHER_CBUS__Y;
	wire         RST_INV_PERI_CBUS__PERI_CBUS__Y;
	wire         RST_INV_USB3_CBUS__USB3_CBUS__Y;
	wire         RST_INV_KETI_CBUS__KETI_CBUS__Y;
	wire         RST_INV_CPU_FBUS__CPU_FBUS__Y;
	wire         RST_INV_CBU_CBUS__CBU_CBUS__Y;
	wire         RST_INV_DDR0_CBUS__DDR0_CBUS__Y;
	wire         RST_INV_DDR0_DBUS__DDR0_DBUS__Y;
	wire         RST_INV_DDR1_CBUS__DDR1_CBUS__Y;
	wire         RST_INV_DDR1_DBUS__DDR1_DBUS__Y;
	wire         RST_INV_SD_CBUS__SD_CBUS__Y;
	wire         RST_INV_EMMC_CBUS__EMMC_CBUS__Y;
	wire         RST_INV_CAMERA_DBUS__CAMERA_DBUS__Y;
	wire         RST_INV_ETHER_DBUS__ETHER_DBUS__Y;
	wire         RST_INV_PERI_DBUS__PERI_DBUS__Y;
	wire         RST_INV_USB3_DBUS__USB3_DBUS__Y;
	wire         RST_INV_KETI_DBUS0__KETI_DBUS0__Y;
	wire         RST_INV_KETI_DBUS1__KETI_DBUS1__Y;
	wire         RST_INV_KETI_DBUS2__KETI_DBUS2__Y;
	wire         RST_INV_CPU_CBUS__CPU_CBUS__Y;
	wire         RST_INV_CPU_DBUS__CPU_DBUS__Y;
	wire         RST_INV_CBU_DBUS__CBU_DBUS__Y;
	wire         RST_INV_SD_DBUS__SD_DBUS__Y;
	wire         RST_INV_EMMC_DBUS__EMMC_DBUS__Y;
	wire         SystemCRG__RESET_INVERTER__GLOBAL__RSTN__OSC;
	wire         RESET_INVERTER__mainbus_subsystem__Y;
	wire         POR_0__SystemCRG__SYS;

	assign POR_0__DFT__SYS_OUT = POR_0__SystemCRG__SYS;

	RheaMAINBUSSubsystem_bf9d4df
	mainbus_subsystem (
		 .auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_ready                                 (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_valid                                 (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_id                               (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_addr                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_len                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_size                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_burst                            (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_lock                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_lock)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_cache                            (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_cache)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_prot                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_ready                                  (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_valid                                  (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_data                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_strb                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_last                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_ready                                  (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_valid                                  (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_id                                (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_resp                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_ready                                 (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_valid                                 (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_id                               (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_addr                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_len                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_size                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_burst                            (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_lock                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_lock)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_cache                            (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_cache)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_prot                             (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_ready                                  (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_valid                                  (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_id                                (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_data                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_resp                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_last                              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_ready                             (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_valid                             (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_id                           (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_addr                         (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_len                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_size                         (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_burst                        (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_prot                         (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_ready                              (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_valid                              (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_data                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_strb                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_last                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_ready                              (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_valid                              (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_bits_id                            (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_bits_resp                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_ready                             (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_valid                             (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_id                           (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_addr                         (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_len                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_size                         (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_burst                        (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_prot                         (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_ready                              (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_valid                              (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_id                            (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_data                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_resp                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_last                          (mainbus_subsystem__DDR1_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_1_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_ready                             (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_valid                             (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_id                           (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_addr                         (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_len                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_size                         (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_burst                        (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_prot                         (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_ready                              (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_valid                              (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_data                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_strb                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_last                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_ready                              (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_valid                              (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_bits_id                            (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_bits_resp                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_ready                             (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_valid                             (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_id                           (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_addr                         (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_len                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_size                         (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_burst                        (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_prot                         (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_ready                              (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_valid                              (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_id                            (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_data                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_resp                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_last                          (mainbus_subsystem__DDR0_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_LPDDR4_AXI4_CBUS_32_axi4_out_0_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_ready                               (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_valid                               (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_id                             (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_addr                           (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_len                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_size                           (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_burst                          (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_prot                           (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_ready                                (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_valid                                (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_data                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_strb                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_last                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_ready                                (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_valid                                (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_bits_id                              (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_bits_resp                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_ready                               (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_valid                               (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_id                             (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_addr                           (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_len                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_size                           (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_burst                          (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_prot                           (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_ready                                (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_valid                                (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_id                              (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_data                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_resp                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_last                            (mainbus_subsystem__CAMERA_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CAMERA_AXI4_CBUS_32_axi4_out_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_ready                              (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_valid                              (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_id                            (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_addr                          (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_len                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_size                          (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_burst                         (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_prot                          (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_ready                               (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_valid                               (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_data                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_strb                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_last                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_ready                               (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_valid                               (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_bits_id                             (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_bits_resp                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_ready                              (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_valid                              (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_id                            (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_addr                          (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_len                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_size                          (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_burst                         (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_prot                          (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_ready                               (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_valid                               (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_id                             (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_data                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_resp                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_last                           (mainbus_subsystem__EMMC_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_1_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_ready                              (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_valid                              (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_id                            (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_addr                          (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_len                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_size                          (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_burst                         (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_prot                          (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_ready                               (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_valid                               (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_data                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_strb                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_last                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_ready                               (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_valid                               (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_bits_id                             (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_bits_resp                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_ready                              (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_valid                              (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_id                            (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_addr                          (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_len                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_size                          (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_burst                         (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_prot                          (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_ready                               (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_valid                               (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_id                             (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_data                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_resp                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_last                           (mainbus_subsystem__SD_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_SDMMC_AXI4_CBUS_32_axi4_out_0_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_ready                                (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_valid                                (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_id                              (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_addr                            (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_len                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_size                            (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_burst                           (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_prot                            (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_ready                                 (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_valid                                 (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_data                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_strb                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_last                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_ready                                 (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_valid                                 (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_bits_id                               (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_bits_resp                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_ready                                (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_valid                                (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_id                              (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_addr                            (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_len                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_size                            (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_burst                           (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_prot                            (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_ready                                 (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_valid                                 (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_id                               (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_data                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_resp                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_last                             (mainbus_subsystem__ETHER_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_ETHER_AXI4_CBUS_32_axi4_out_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_ready                                 (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_valid                                 (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_id                               (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_addr                             (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_len                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_size                             (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_burst                            (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_prot                             (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_ready                                  (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_valid                                  (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_data                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_strb                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_last                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_ready                                  (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_valid                                  (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_bits_id                                (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_bits_resp                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_ready                                 (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_valid                                 (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_id                               (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_addr                             (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_len                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_size                             (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_burst                            (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_prot                             (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_ready                                  (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_valid                                  (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_id                                (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_data                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_resp                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_last                              (mainbus_subsystem__PERI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_PERI_AXI4_CBUS_32_axi4_out_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_ready                                 (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_valid                                 (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_id                               (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_addr                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_len                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_size                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_burst                            (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_lock                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_lock)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_cache                            (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_cache)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_prot                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_ready                                  (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_valid                                  (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_data                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_strb                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_last                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_ready                                  (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_valid                                  (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_bits_id                                (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_bits_resp                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_ready                                 (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_valid                                 (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_id                               (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_addr                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_len                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_size                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_burst                            (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_lock                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_lock)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_cache                            (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_cache)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_prot                             (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_ready                                  (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_valid                                  (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_id                                (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_data                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_resp                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_last                              (mainbus_subsystem__USB3_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_USB3_AXI4_CBUS_32_axi4_out_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_ready                                  (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_valid                                  (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_id                                (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_addr                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_len                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_size                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_burst                             (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_lock                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_lock)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_cache                             (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_cache)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_prot                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_ready                                   (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_valid                                   (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_data                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_strb                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_last                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_ready                                   (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_valid                                   (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_bits_id                                 (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_bits_resp                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_ready                                  (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_valid                                  (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_id                                (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_addr                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_len                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_size                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_burst                             (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_lock                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_lock)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_cache                             (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_cache)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_prot                              (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_ready                                   (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_valid                                   (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_id                                 (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_data                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_resp                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_last                               (mainbus_subsystem__CBU_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_CBU_AXI4_CBUS_32_axi4_out_r_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_ready                                 (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_valid                                 (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_id                               (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_addr                             (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_len                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_size                             (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_burst                            (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_prot                             (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_aw_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_ready                                  (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_valid                                  (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_data                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_strb                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_strb)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_last                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_w_bits_last)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_ready                                  (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_valid                                  (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_bits_id                                (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_bits_resp                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_b_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_ready                                 (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_valid                                 (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_id                               (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_addr                             (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_addr)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_len                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_len)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_size                             (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_size)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_burst                            (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_burst)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_prot                             (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_ar_bits_prot)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_ready                                  (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_ready)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_valid                                  (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_valid)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_id                                (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_id)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_data                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_data)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_resp                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_resp)
		,.auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_last                              (mainbus_subsystem__KETI_CBUS__auto_AXI4_CBUS0_32_coupler_to_AXI4Bus_KETI_AXI4_CBUS_32_axi4_out_r_bits_last)
		,.auto_AXI4_CBUS0_32_fixedClockNode_out_clock                                                               (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_fixedClockNode_out_clock)
		,.auto_AXI4_CBUS0_32_fixedClockNode_out_reset                                                               (mainbus_subsystem__RST_INV_CPU_CBUS__auto_AXI4_CBUS0_32_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_ready                                  (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_ready)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_valid                                  (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_valid)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_id                                (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_id)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_addr                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_addr)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_len                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_len)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_size                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_size)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_burst                             (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_burst)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_lock                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_lock)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_cache                             (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_cache)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_prot                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_aw_bits_prot)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_ready                                   (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_ready)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_valid                                   (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_valid)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_data                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_data)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_strb                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_strb)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_last                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_w_bits_last)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_ready                                   (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_ready)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_valid                                   (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_valid)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_bits_id                                 (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_bits_id)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_bits_resp                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_b_bits_resp)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_ready                                  (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_ready)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_valid                                  (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_valid)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_id                                (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_id)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_addr                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_addr)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_len                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_len)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_size                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_size)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_burst                             (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_burst)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_lock                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_lock)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_cache                             (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_cache)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_prot                              (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_ar_bits_prot)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_ready                                   (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_ready)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_valid                                   (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_valid)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_id                                 (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_id)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_data                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_data)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_resp                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_resp)
		,.auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_last                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_coupler_to_AXI4Bus_CPU_AXI4_FBUS_64_axi4_out_r_bits_last)
		,.auto_AXI4_DBUS2_64_fixedClockNode_out_clock                                                               (mainbus_subsystem__CPU_FBUS__auto_AXI4_DBUS2_64_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS2_64_fixedClockNode_out_reset                                                               (mainbus_subsystem__RST_INV_CPU_FBUS__auto_AXI4_DBUS2_64_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_ready                             (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_valid                             (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_addr                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_addr)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_len                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_len)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_size                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_size)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_burst                        (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_burst)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_lock                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_lock)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_cache                        (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_cache)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_prot                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_prot)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_ready                              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_valid                              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_data                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_data)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_strb                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_strb)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_last                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_last)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_ready                              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_valid                              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_bits_resp                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_bits_resp)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_ready                             (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_valid                             (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_addr                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_addr)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_len                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_len)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_size                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_size)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_burst                        (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_burst)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_lock                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_lock)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_cache                        (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_cache)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_prot                         (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_prot)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_ready                              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_valid                              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_data                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_data)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_resp                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_resp)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_last                          (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_last)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_ready                             (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_valid                             (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_addr                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_addr)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_len                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_len)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_size                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_size)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_burst                        (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_burst)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_lock                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_lock)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_cache                        (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_cache)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_prot                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_prot)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_ready                              (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_valid                              (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_data                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_data)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_strb                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_strb)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_last                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_last)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_ready                              (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_valid                              (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_bits_resp                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_bits_resp)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_ready                             (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_valid                             (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_addr                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_addr)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_len                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_len)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_size                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_size)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_burst                        (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_burst)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_lock                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_lock)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_cache                        (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_cache)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_prot                         (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_prot)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_ready                              (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_valid                              (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_data                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_data)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_resp                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_resp)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_last                          (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_last)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_ready                               (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_valid                               (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_id                             (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_addr                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_len                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_size                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_burst                          (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_lock                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_cache                          (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_cache)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_prot                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_ready                                (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_valid                                (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_data                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_strb                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_last                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_ready                                (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_valid                                (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_id                              (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_resp                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_ready                               (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_valid                               (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_id                             (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_addr                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_len                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_size                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_burst                          (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_lock                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_cache                          (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_cache)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_prot                           (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_ready                                (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_ready)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_valid                                (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_valid)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_id                              (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_data                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_resp                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_last                            (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS1_64_fixedClockNode_out_clock                                                               (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS1_64_fixedClockNode_out_reset                                                               (mainbus_subsystem__RST_INV_EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_ready                                (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_valid                                (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_id                              (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_addr                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_len                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_size                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_burst                           (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_lock                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_cache                           (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_cache)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_prot                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_ready                                 (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_valid                                 (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_data                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_strb                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_last                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_ready                                 (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_valid                                 (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_id                               (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_resp                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_ready                                (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_valid                                (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_id                              (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_addr                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_len                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_size                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_burst                           (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_lock                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_cache                           (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_cache)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_prot                            (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_ready                                 (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_valid                                 (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_id                               (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_data                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_resp                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_last                             (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_ready                                (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_valid                                (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_id                              (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_addr                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_len                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_size                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_burst                           (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_lock                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_cache                           (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_cache)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_prot                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_ready                                 (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_valid                                 (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_data                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_strb                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_last                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_ready                                 (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_valid                                 (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_id                               (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_resp                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_ready                                (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_valid                                (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_id                              (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_addr                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_len                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_size                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_burst                           (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_lock                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_cache                           (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_cache)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_prot                            (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_ready                                 (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_ready)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_valid                                 (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_valid)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_id                               (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_data                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_resp                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_last                             (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS0_64_fixedClockNode_out_clock                                                               (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS0_64_fixedClockNode_out_reset                                                               (mainbus_subsystem__RST_INV_PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_ready                            (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_ready)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_valid                            (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_valid)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_id                          (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_id)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_addr                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_addr)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_len                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_len)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_size                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_size)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_burst                       (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_burst)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_lock                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_lock)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_cache                       (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_cache)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_prot                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_prot)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_ready                             (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_ready)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_valid                             (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_valid)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_data                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_data)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_strb                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_strb)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_last                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_last)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_ready                             (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_ready)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_valid                             (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_valid)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_id                           (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_id)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_resp                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_resp)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_ready                            (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_ready)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_valid                            (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_valid)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_id                          (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_id)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_addr                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_addr)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_len                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_len)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_size                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_size)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_burst                       (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_burst)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_lock                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_lock)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_cache                       (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_cache)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_prot                        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_prot)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_ready                             (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_ready)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_valid                             (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_valid)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_id                           (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_id)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_data                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_data)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_resp                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_resp)
		,.auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_last                         (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_last)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_ready                         (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_ready)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_valid                         (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_valid)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_id                       (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_id)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_addr                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_addr)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_len                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_len)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_size                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_size)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_burst                    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_burst)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_lock                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_lock)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_cache                    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_cache)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_prot                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_prot)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_ready                          (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_ready)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_valid                          (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_valid)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_data                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_data)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_strb                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_strb)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_last                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_last)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_ready                          (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_ready)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_valid                          (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_valid)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_id                        (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_id)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_resp                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_resp)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_ready                         (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_ready)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_valid                         (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_valid)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_id                       (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_id)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_addr                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_addr)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_len                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_len)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_size                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_size)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_burst                    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_burst)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_lock                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_lock)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_cache                    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_cache)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_prot                     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_prot)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_ready                          (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_ready)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_valid                          (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_valid)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_id                        (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_id)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_data                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_data)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_resp                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_resp)
		,.auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_last                      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_last)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_ready                             (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_ready)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_valid                             (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_valid)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_id                           (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_id)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_addr                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_addr)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_len                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_len)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_size                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_size)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_burst                        (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_burst)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_lock                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_lock)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_prot                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_prot)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_ready                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_ready)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_valid                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_valid)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_data                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_data)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_strb                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_strb)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_last                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_last)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_ready                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_ready)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_valid                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_valid)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_id                            (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_id)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_resp                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_resp)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_ready                             (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_ready)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_valid                             (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_valid)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_id                           (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_id)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_addr                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_addr)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_len                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_len)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_size                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_size)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_burst                        (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_burst)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_lock                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_lock)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_prot                         (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_prot)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_ready                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_ready)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_valid                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_valid)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_id                            (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_id)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_data                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_data)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_resp                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_resp)
		,.auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_last                          (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_last)
		,.auto_AXI4_DBUS7_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__DDR1_DBUS__auto_AXI4_DBUS7_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS7_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_DDR1_DBUS__auto_AXI4_DBUS7_256_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_ready                             (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_ready)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_valid                             (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_valid)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_id                           (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_id)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_addr                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_addr)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_len                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_len)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_size                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_size)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_burst                        (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_burst)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_lock                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_lock)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_prot                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_aw_bits_prot)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_ready                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_ready)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_valid                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_valid)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_data                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_data)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_strb                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_strb)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_last                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_w_bits_last)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_ready                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_ready)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_valid                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_valid)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_id                            (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_id)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_resp                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_b_bits_resp)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_ready                             (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_ready)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_valid                             (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_valid)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_id                           (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_id)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_addr                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_addr)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_len                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_len)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_size                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_size)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_burst                        (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_burst)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_lock                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_lock)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_prot                         (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_ar_bits_prot)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_ready                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_ready)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_valid                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_valid)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_id                            (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_id)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_data                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_data)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_resp                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_resp)
		,.auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_last                          (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_coupler_to_AXI4Bus_LPDDR4_AXI4_DBUS_256_axi4_out_r_bits_last)
		,.auto_AXI4_DBUS6_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__DDR0_DBUS__auto_AXI4_DBUS6_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS6_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_DDR0_DBUS__auto_AXI4_DBUS6_256_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS5_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS5_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS5_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_CPU_DBUS__auto_AXI4_DBUS5_256_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS4_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS4_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS4_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_CAMERA_DBUS__auto_AXI4_DBUS4_256_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS3_256_fixedClockNode_out_clock                                                              ()
		,.auto_AXI4_DBUS3_256_fixedClockNode_out_reset                                                              ()
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_ready                             (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_ready)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_valid                             (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_valid)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_id                           (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_addr                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_len                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_size                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_burst                        (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_lock                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_prot                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_ready                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_ready)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_valid                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_valid)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_data                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_strb                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_last                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_ready                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_ready)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_valid                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_valid)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_id                            (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_resp                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_ready                             (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_ready)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_valid                             (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_valid)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_id                           (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_addr                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_len                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_size                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_burst                        (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_lock                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_prot                         (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_ready                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_ready)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_valid                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_valid)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_id                            (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_data                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_resp                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_last                          (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS2_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS2_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_KETI_DBUS2__auto_AXI4_DBUS2_256_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_ready                             (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_ready)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_valid                             (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_valid)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_id                           (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_addr                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_len                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_size                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_burst                        (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_lock                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_prot                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_ready                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_ready)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_valid                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_valid)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_data                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_strb                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_last                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_ready                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_ready)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_valid                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_valid)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_id                            (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_resp                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_ready                             (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_ready)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_valid                             (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_valid)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_id                           (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_addr                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_len                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_size                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_burst                        (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_lock                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_prot                         (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_ready                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_ready)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_valid                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_valid)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_id                            (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_data                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_resp                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_last                          (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS1_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS1_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_KETI_DBUS1__auto_AXI4_DBUS1_256_fixedClockNode_out_reset)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_ready                               (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_valid                               (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_id                             (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_addr                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_len                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_size                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_burst                          (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_lock                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_prot                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_ready                                (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_valid                                (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_data                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_strb                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_last                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_ready                                (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_valid                                (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_id                              (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_resp                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_ready                               (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_valid                               (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_id                             (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_addr                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_len                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_size                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_burst                          (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_lock                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_prot                           (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_ready                                (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_valid                                (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_id                              (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_data                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_resp                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_last                            (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_ready                             (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_valid                             (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_id                           (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_addr                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_addr)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_len                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_len)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_size                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_size)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_burst                        (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_burst)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_lock                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_lock)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_prot                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_prot)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_ready                              (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_valid                              (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_data                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_data)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_strb                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_strb)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_last                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_last)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_ready                              (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_valid                              (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_id                            (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_resp                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_resp)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_ready                             (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_valid                             (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_id                           (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_addr                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_addr)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_len                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_len)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_size                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_size)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_burst                        (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_burst)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_lock                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_lock)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_prot                         (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_prot)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_ready                              (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_ready)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_valid                              (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_valid)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_id                            (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_id)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_data                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_data)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_resp                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_resp)
		,.auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_last                          (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_last)
		,.auto_AXI4_DBUS0_256_fixedClockNode_out_clock                                                              (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_clock)
		,.auto_AXI4_DBUS0_256_fixedClockNode_out_reset                                                              (mainbus_subsystem__RST_INV_CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_reset)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE         (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK          ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE         (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE         (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK          ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE         (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_OSC_CRG_0_dft_out_DFT__TEST_MODE              (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_OSC_CRG_0_dft_out_DFT__BIST_MODE              (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_OSC_CRG_0_dft_out_DFT__BIST_CLK               ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_OSC_CRG_0_dft_out_DFT__SCAN_MODE              (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_1_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN       (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE         (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK          ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE         (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE         (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK          ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE         (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE              (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE              (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK               ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE              (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_LPDDR4_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN       (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_KETI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE            (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE            (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK             ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE            (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN     (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE            (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE            (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK             ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE            (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN     (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE                 (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE                 (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK                  ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE                 (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBU_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN          (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_USB3_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_PERI_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE       (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE       (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK        ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE       (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN(I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE       (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE       (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK        ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE       (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN(I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE            (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE            (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK             ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE            (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_ETHERNET_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN     (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_EMMC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE           (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK            ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE           (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_SDHC_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_MODE         (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__BIST_CLK          ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__SCAN_MODE         (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_CRG_0_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_MODE         (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__BIST_CLK          ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__SCAN_MODE         (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_CRG_0_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE              (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_MODE              (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__BIST_CLK               ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__SCAN_MODE              (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CAMERA_SUBSYSTEM_0_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN       (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CPU_SUBSYSTEM_OSC_CRG_0_dft_out_DFT__TEST_MODE                   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CPU_SUBSYSTEM_OSC_CRG_0_dft_out_DFT__BIST_MODE                   (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CPU_SUBSYSTEM_OSC_CRG_0_dft_out_DFT__BIST_CLK                    ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CPU_SUBSYSTEM_OSC_CRG_0_dft_out_DFT__SCAN_MODE                   (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CPU_SUBSYSTEM_OSC_CRG_0_dft_out_DFT__TEST_MODE_RESETN            (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_DBUS_CRG_0_dft_out_DFT__TEST_MODE                                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_DBUS_CRG_0_dft_out_DFT__BIST_MODE                                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_DBUS_CRG_0_dft_out_DFT__BIST_CLK                                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_DBUS_CRG_0_dft_out_DFT__SCAN_MODE                                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_DBUS_CRG_0_dft_out_DFT__TEST_MODE_RESETN                         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBUS_CRG_0_dft_out_DFT__TEST_MODE                                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBUS_CRG_0_dft_out_DFT__BIST_MODE                                (I_BIST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBUS_CRG_0_dft_out_DFT__BIST_CLK                                 ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBUS_CRG_0_dft_out_DFT__SCAN_MODE                                (MAINBUS_0__DFT_SCAN_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_CBUS_CRG_0_dft_out_DFT__TEST_MODE_RESETN                         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_1_mainpll1_out_clock                      (CLK__DDR1__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_1_mainpll1_out_reset                      ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_1_mainpll0_out_clock                      (CLK__DDR1__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_1_mainpll0_out_reset                      ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_1_osc_out_clock                           (CLK__DDR1__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_1_osc_out_reset                           (RST__DDR1__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_0_mainpll1_out_clock                      (CLK__DDR0__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_0_mainpll1_out_reset                      ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_0_mainpll0_out_clock                      (CLK__DDR0__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_0_mainpll0_out_reset                      ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_0_osc_out_clock                           (CLK__DDR0__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_lpddr4_subsystem_0_osc_out_reset                           (RST__DDR0__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_keti_subsystem_0_mainpll1_out_clock                        (CLK__KETI__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_keti_subsystem_0_mainpll0_out_clock                        (CLK__KETI__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_keti_subsystem_0_osc_out_clock                             (CLK__KETI__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_keti_subsystem_0_osc_out_reset                             (RST__KETI__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_cbu_subsystem_0_mainpll1_out_clock                         (CLK__CBU__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_cbu_subsystem_0_mainpll0_out_clock                         (CLK__CBU__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_cbu_subsystem_0_osc_out_clock                              (CLK__CBU__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_cbu_subsystem_0_osc_out_reset                              (RST__CBU__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_usb3_subsystem_0_mainpll1_out_clock                        (CLK__USB3__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_usb3_subsystem_0_mainpll0_out_clock                        (CLK__USB3__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_usb3_subsystem_0_osc_out_clock                             (CLK__USB3__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_usb3_subsystem_0_osc_out_reset                             (RST__USB3__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_peri_subsystem_0_mainpll1_out_clock                        (CLK__PERI__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_peri_subsystem_0_mainpll0_out_clock                        (CLK__PERI__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_peri_subsystem_0_osc_out_clock                             (CLK__PERI__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_peri_subsystem_0_osc_out_reset                             (RST__PERI__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_ethernet_subsystem_0_mainpll1_out_clock                    (CLK__ETHERNET__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_ethernet_subsystem_0_mainpll1_out_reset                    ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_ethernet_subsystem_0_mainpll0_out_clock                    (CLK__ETHERNET__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_ethernet_subsystem_0_mainpll0_out_reset                    ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_ethernet_subsystem_0_osc_out_clock                         (CLK__ETHERNET__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_ethernet_subsystem_0_osc_out_reset                         (RST__ETHERNET__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_emmc_subsystem_0_mainpll1_out_clock                        (CLK__EMMC__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_emmc_subsystem_0_mainpll1_out_reset                        ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_emmc_subsystem_0_mainpll0_out_clock                        (CLK__EMMC__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_emmc_subsystem_0_mainpll0_out_reset                        ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_emmc_subsystem_0_osc_out_clock                             (CLK__EMMC__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_emmc_subsystem_0_osc_out_reset                             (RST__EMMC__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_sdhc_subsystem_0_mainpll1_out_clock                        (CLK__SDHC__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_sdhc_subsystem_0_mainpll1_out_reset                        ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_sdhc_subsystem_0_mainpll0_out_clock                        (CLK__SDHC__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_sdhc_subsystem_0_mainpll0_out_reset                        ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_sdhc_subsystem_0_osc_out_clock                             (CLK__SDHC__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_sdhc_subsystem_0_osc_out_reset                             (RST__SDHC__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_camera_subsystem_0_mainpll1_out_clock                      (CLK__CAMERA__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_camera_subsystem_0_mainpll1_out_reset                      ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_camera_subsystem_0_mainpll0_out_clock                      (CLK__CAMERA__SRC__MAINPLL0)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_camera_subsystem_0_mainpll0_out_reset                      ()
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_camera_subsystem_0_osc_out_clock                           (CLK__CAMERA__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_camera_subsystem_0_osc_out_reset                           (RST__CAMERA__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_cpu_subsystem_0_osc_out_clock                              (CLK__CPU__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_crgWrapper_g_clk_cpu_subsystem_0_osc_out_reset                              (RST__CPU__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_sfrWrapper_custom_bridge_in_1_io                                            (mainbus_subsystem__SystemCRG__auto_RheaMAINBUSSubsystem_SCU_sfrWrapper_custom_bridge_in_1_io)
		,.auto_RheaMAINBUSSubsystem_SCU_sfrWrapper_custom_bridge_in_0_io                                            (PATCHED__BOOT_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_DIV_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_DIV_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_OSC_DIV_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_1_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_LPDDR4_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_KETI_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE              (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN       (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE              (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN       (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN            (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBU_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_USB3_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_PERI_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE         (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN  (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE              (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN       (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_ETHERNET_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE      (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_EMMC_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN      (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_SDHC_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_DIV_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_2_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_1_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL1_MUX_dft_nodes_out_0_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE           (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_DIV_dft_out_DFT__TEST_MODE_RESETN    (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_2_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_1_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_MAINPLL0_MUX_dft_nodes_out_0_DFT__TEST_MODE   (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE                (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN         (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CAMERA_SUBSYSTEM_0_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE        (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CPU_SUBSYSTEM_OSC_DIV_dft_out_DFT__TEST_MODE                     (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CPU_SUBSYSTEM_OSC_DIV_dft_out_DFT__TEST_MODE_RESETN              (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CPU_SUBSYSTEM_OSC_MUX_dft_nodes_out_2_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CPU_SUBSYSTEM_OSC_MUX_dft_nodes_out_1_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CPU_SUBSYSTEM_OSC_MUX_dft_nodes_out_0_DFT__TEST_MODE             (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_DBUS_DIV_dft_out_DFT__TEST_MODE                                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_DBUS_DIV_dft_out_DFT__TEST_MODE_RESETN                           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_DBUS_MUX_dft_nodes_out_2_DFT__TEST_MODE                          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_DBUS_MUX_dft_nodes_out_1_DFT__TEST_MODE                          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_DBUS_MUX_dft_nodes_out_0_DFT__TEST_MODE                          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBUS_DIV_dft_out_DFT__TEST_MODE                                  (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBUS_DIV_dft_out_DFT__TEST_MODE_RESETN                           (I_TEST_MODE_RESETN)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBUS_MUX_dft_nodes_out_2_DFT__TEST_MODE                          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBUS_MUX_dft_nodes_out_1_DFT__TEST_MODE                          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_CBUS_MUX_dft_nodes_out_0_DFT__TEST_MODE                          (I_TEST_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_P_CLK_OSC_in_clock                                               (CLK__SRC__OSC)
		,.auto_RheaMAINBUSSubsystem_SCU_cmdWrapper_P_CLK_OSC_in_reset                                               (RESET_INVERTER__mainbus_subsystem__Y)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_1_TEST__SCAN                                       (1'h0)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_1_TEST__PLL                                        (DFT__PLL_MAIN_1_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_1_TEST__PLL_IN                                     (DFT__PLL_MAIN_1_IN)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_1_TEST__PLL_OUT                                    (DFT__PLL_MAIN_1_OUT)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_0_TEST__SCAN                                       (1'h0)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_0_TEST__PLL                                        (DFT__PLL_MAIN_0_MODE)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_0_TEST__PLL_IN                                     (DFT__PLL_MAIN_0_IN)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_dft_nodes_out_0_TEST__PLL_OUT                                    (DFT__PLL_MAIN_0_OUT)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_p_clk_mainpll1_in_clock                                          (CLK__SRC__MAINPLL1)
		,.auto_RheaMAINBUSSubsystem_SCU_pllWrapper_p_clk_mainpll0_in_clock                                          (CLK__SRC__MAINPLL0)
	);




	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(4)
		,.AWID_W(4)
		,.BID_W(4)
		,.RID_W(4)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(128)
		,.WDATA_W(128)
		,.WSTRB_W(16)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) CAMERA_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__CAMERA_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__CAMERA_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS10_256_coupler_from_AXI4Bus_CAMERA_AXI4_DBUS_128_widget_in_aw_ready)
		,.RSTN__SLV             (RST_INV_CAMERA_DBUS__CAMERA_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__CAMERA_DBUS__auto_AXI4_DBUS4_256_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__CAMERA_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__CAMERA_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_CAMERA_DBUS (
		 .A(mainbus_subsystem__RST_INV_CAMERA_DBUS__auto_AXI4_DBUS4_256_fixedClockNode_out_reset)
		,.Y(RST_INV_CAMERA_DBUS__CAMERA_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(4)
		,.AWID_W(4)
		,.BID_W(4)
		,.RID_W(4)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(64)
		,.WDATA_W(64)
		,.WSTRB_W(8)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) ETHER_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__ETHER_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__ETHER_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__ETHER_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_ETHER_AXI4_DBUS_64_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_ETHER_DBUS__ETHER_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__ETHER_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__ETHER_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_ETHER_DBUS (
		 .A(mainbus_subsystem__RST_INV_EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_reset)
		,.Y(RST_INV_ETHER_DBUS__ETHER_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(5)
		,.AWID_W(5)
		,.BID_W(5)
		,.RID_W(5)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(64)
		,.WDATA_W(64)
		,.WSTRB_W(8)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) PERI_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__PERI_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__PERI_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_PERI_AXI4_DBUS_64_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_PERI_DBUS__PERI_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__PERI_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__PERI_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_PERI_DBUS (
		 .A(mainbus_subsystem__RST_INV_PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_reset)
		,.Y(RST_INV_PERI_DBUS__PERI_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(4)
		,.AWID_W(4)
		,.BID_W(4)
		,.RID_W(4)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(64)
		,.WDATA_W(64)
		,.WSTRB_W(8)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) USB3_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__USB3_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__USB3_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__USB3_DBUS__auto_AXI4_DBUS0_64_coupler_from_AXI4Bus_USB3_AXI4_DBUS_64_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_USB3_DBUS__USB3_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__USB3_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__USB3_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_USB3_DBUS (
		 .A(mainbus_subsystem__RST_INV_PERI_DBUS__auto_AXI4_DBUS0_64_fixedClockNode_out_reset)
		,.Y(RST_INV_USB3_DBUS__USB3_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(5)
		,.AWID_W(5)
		,.BID_W(5)
		,.RID_W(5)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(256)
		,.WDATA_W(256)
		,.WSTRB_W(32)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) KETI_DBUS0 (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    ()
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    ()
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__KETI_DBUS0__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__KETI_DBUS0__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__KETI_DBUS0__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS0_256_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_KETI_DBUS0__KETI_DBUS0__Y)
		,.CLK__SLV              (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__KETI_DBUS0__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__KETI_DBUS0__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_KETI_DBUS0 (
		 .A(mainbus_subsystem__RST_INV_CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_reset)
		,.Y(RST_INV_KETI_DBUS0__KETI_DBUS0__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(5)
		,.AWID_W(5)
		,.BID_W(5)
		,.RID_W(5)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(256)
		,.WDATA_W(256)
		,.WSTRB_W(32)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) KETI_DBUS1 (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    ()
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    ()
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__KETI_DBUS1__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__KETI_DBUS1__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS1_256_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_KETI_DBUS1__KETI_DBUS1__Y)
		,.CLK__SLV              (mainbus_subsystem__KETI_DBUS1__auto_AXI4_DBUS1_256_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__KETI_DBUS1__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__KETI_DBUS1__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_KETI_DBUS1 (
		 .A(mainbus_subsystem__RST_INV_KETI_DBUS1__auto_AXI4_DBUS1_256_fixedClockNode_out_reset)
		,.Y(RST_INV_KETI_DBUS1__KETI_DBUS1__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(5)
		,.AWID_W(5)
		,.BID_W(5)
		,.RID_W(5)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(256)
		,.WDATA_W(256)
		,.WSTRB_W(32)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) KETI_DBUS2 (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    ()
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    ()
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__KETI_DBUS2__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__KETI_DBUS2__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_coupler_from_AXI4Bus_KETI_AXI4_DBUS2_256_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_KETI_DBUS2__KETI_DBUS2__Y)
		,.CLK__SLV              (mainbus_subsystem__KETI_DBUS2__auto_AXI4_DBUS2_256_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__KETI_DBUS2__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__KETI_DBUS2__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_KETI_DBUS2 (
		 .A(mainbus_subsystem__RST_INV_KETI_DBUS2__auto_AXI4_DBUS2_256_fixedClockNode_out_reset)
		,.Y(RST_INV_KETI_DBUS2__KETI_DBUS2__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(1)
		,.AWID_W(1)
		,.BID_W(1)
		,.RID_W(1)
		,.WID_W(1)
		,.ARADDR_W(32)
		,.AWADDR_W(32)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(32)
		,.WDATA_W(32)
		,.WSTRB_W(4)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) CPU_CBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__CPU_CBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__CPU_CBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_coupler_from_AXI4Bus_CPU_AXI4_CBUS_64_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_CPU_CBUS__CPU_CBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__CPU_CBUS__auto_AXI4_CBUS0_32_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__CPU_CBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__CPU_CBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_CPU_CBUS (
		 .A(mainbus_subsystem__RST_INV_CPU_CBUS__auto_AXI4_CBUS0_32_fixedClockNode_out_reset)
		,.Y(RST_INV_CPU_CBUS__CPU_CBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(9)
		,.AWID_W(9)
		,.BID_W(9)
		,.RID_W(9)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(128)
		,.WDATA_W(128)
		,.WSTRB_W(16)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) CPU_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__CPU_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__CPU_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS11_256_coupler_from_AXI4Bus_CPU_AXI4_DBUS_256_widget_in_aw_ready)
		,.RSTN__SLV             (RST_INV_CPU_DBUS__CPU_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__CPU_DBUS__auto_AXI4_DBUS5_256_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__CPU_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__CPU_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_CPU_DBUS (
		 .A(mainbus_subsystem__RST_INV_CPU_DBUS__auto_AXI4_DBUS5_256_fixedClockNode_out_reset)
		,.Y(RST_INV_CPU_DBUS__CPU_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(1)
		,.AWID_W(1)
		,.BID_W(1)
		,.RID_W(1)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(256)
		,.WDATA_W(256)
		,.WSTRB_W(32)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) CBU_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_len)
		,.AXI4__SLV__ARID       (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_id)
		,.AXI4__SLV__ARCACHE    ()
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_len)
		,.AXI4__SLV__AWID       (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_id)
		,.AXI4__SLV__AWCACHE    ()
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__CBU_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__CBU_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_last)
		,.AXI4__SLV__RID        (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_id)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_resp)
		,.AXI4__SLV__BID        (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_b_bits_id)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_coupler_from_AXI4Bus_CBU_AXI4_DBUS_256_axi4_in_aw_ready)
		,.RSTN__SLV             (RST_INV_CBU_DBUS__CBU_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__CBU_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__CBU_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_CBU_DBUS (
		 .A(mainbus_subsystem__RST_INV_CBU_DBUS__auto_AXI4_DBUS0_256_fixedClockNode_out_reset)
		,.Y(RST_INV_CBU_DBUS__CBU_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(1)
		,.AWID_W(1)
		,.BID_W(1)
		,.RID_W(1)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(64)
		,.WDATA_W(64)
		,.WSTRB_W(8)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) SD_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_len)
		,.AXI4__SLV__ARID       ()
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_len)
		,.AXI4__SLV__AWID       ()
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__SD_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__SD_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_last)
		,.AXI4__SLV__RID        (1'h0)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_b_bits_resp)
		,.AXI4__SLV__BID        (1'h0)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__SD_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_0_aw_ready)
		,.RSTN__SLV             (RST_INV_SD_DBUS__SD_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__SD_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__SD_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_SD_DBUS (
		 .A(mainbus_subsystem__RST_INV_EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_reset)
		,.Y(RST_INV_SD_DBUS__SD_DBUS__Y)
	);

	BusDomainBridge_Slv_Wrap #(
		 .AW_FIFO_DEPTH(4)
		,.W_FIFO_DEPTH(6)
		,.B_FIFO_DEPTH(2)
		,.AR_FIFO_DEPTH(4)
		,.R_FIFO_DEPTH(6)
		,.MST_REG_SLICE_PAYLOAD_OUT(1)
		,.SLV_REG_SLICE_PAYLOAD_OUT(1)
		,.ARID_W(1)
		,.AWID_W(1)
		,.BID_W(1)
		,.RID_W(1)
		,.WID_W(1)
		,.ARADDR_W(36)
		,.AWADDR_W(36)
		,.AWUSER_W(1)
		,.ARUSER_W(1)
		,.RDATA_W(64)
		,.WDATA_W(64)
		,.WSTRB_W(8)
		,.BUSER_W(1)
		,.RUSER_W(1)
		,.WUSER_W(1)
		,.AWLEN_W(8)
		,.AWBURST_W(2)
		,.RRESP_W(2)
		,.ARQOS_W(1)
		,.ARBURST_W(2)
		,.ARLOCK_W(1)
		,.BRESP_W(2)
		,.AWSIZE_W(3)
		,.AWQOS_W(1)
		,.AWPROT_W(3)
		,.AWREGION_W(1)
		,.AWCACHE_W(4)
		,.AWLOCK_W(1)
		,.ARPROT_W(3)
		,.ARCACHE_W(4)
		,.ARREGION_W(1)
		,.ARLEN_W(8)
		,.ARSIZE_W(3)
	) EMMC_DBUS (
		 .AXI4__SLV__RREADY     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_ready)
		,.AXI4__SLV__ARVALID    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_valid)
		,.AXI4__SLV__ARUSER     ()
		,.AXI4__SLV__ARSIZE     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_size)
		,.AXI4__SLV__ARREGION   ()
		,.AXI4__SLV__ARQOS      ()
		,.AXI4__SLV__ARPROT     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_prot)
		,.AXI4__SLV__ARLOCK     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_lock)
		,.AXI4__SLV__ARLEN      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_len)
		,.AXI4__SLV__ARID       ()
		,.AXI4__SLV__ARCACHE    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_cache)
		,.AXI4__SLV__ARBURST    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_burst)
		,.AXI4__SLV__ARADDR     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_bits_addr)
		,.AXI4__SLV__BREADY     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_ready)
		,.AXI4__SLV__WVALID     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_valid)
		,.AXI4__SLV__WUSER      ()
		,.AXI4__SLV__WSTRB      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_strb)
		,.AXI4__SLV__WLAST      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_last)
		,.AXI4__SLV__WID        ()
		,.AXI4__SLV__WDATA      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_bits_data)
		,.AXI4__SLV__AWVALID    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_valid)
		,.AXI4__SLV__AWUSER     ()
		,.AXI4__SLV__AWSIZE     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_size)
		,.AXI4__SLV__AWREGION   ()
		,.AXI4__SLV__AWQOS      ()
		,.AXI4__SLV__AWPROT     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_prot)
		,.AXI4__SLV__AWLOCK     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_lock)
		,.AXI4__SLV__AWLEN      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_len)
		,.AXI4__SLV__AWID       ()
		,.AXI4__SLV__AWCACHE    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_cache)
		,.AXI4__SLV__AWBURST    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_burst)
		,.AXI4__SLV__AWADDR     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_bits_addr)
		,.CLK__PAYLOAD__SLV     (CLK__EMMC_DBUS__SLV)
		,.AXI4__SLV__S2M_PAYLOAD(ASYNC__EMMC_DBUS__SLV)
		,.DFT__TEST_MODE_RESETN (I_TEST_MODE_RESETN)
		,.DFT__TEST_MODE        (I_TEST_MODE)
		,.AXI4__SLV__RVALID     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_valid)
		,.AXI4__SLV__RUSER      (1'h0)
		,.AXI4__SLV__RRESP      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_resp)
		,.AXI4__SLV__RLAST      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_last)
		,.AXI4__SLV__RID        (1'h0)
		,.AXI4__SLV__RDATA      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_r_bits_data)
		,.AXI4__SLV__ARREADY    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_ar_ready)
		,.AXI4__SLV__BVALID     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_valid)
		,.AXI4__SLV__BUSER      (1'h0)
		,.AXI4__SLV__BRESP      (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_b_bits_resp)
		,.AXI4__SLV__BID        (1'h0)
		,.AXI4__SLV__WREADY     (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_w_ready)
		,.AXI4__SLV__AWREADY    (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_coupler_from_AXI4Bus_SDMMC_AXI4_DBUS_64_axi4_in_1_aw_ready)
		,.RSTN__SLV             (RST_INV_EMMC_DBUS__EMMC_DBUS__Y)
		,.CLK__SLV              (mainbus_subsystem__EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_clock)
		,.CLK__PAYLOAD__MST     (CLK__EMMC_DBUS__MST)
		,.AXI4__MST__M2S_PAYLOAD(ASYNC__EMMC_DBUS__MST)
	);

	SEMIFIVE_PRIMITIVE_INV
	RST_INV_EMMC_DBUS (
		 .A(mainbus_subsystem__RST_INV_EMMC_DBUS__auto_AXI4_DBUS1_64_fixedClockNode_out_reset)
		,.Y(RST_INV_EMMC_DBUS__EMMC_DBUS__Y)
	);

	SystemCRG
	SystemCRG (
		 .IO__ERESETN              (IO_PAD__ERESETN__Y)
		,.IO__PORN                 (IO_PAD__PORN__Y)
		,.IO__PERSTN               (1'h1)
		,.IO__TRSTN                (IO_PAD__TRSTN)
		,.IO__TCLK                 (IO_PAD__TCLTK)
		,.I_TEST_MODE              (I_TEST_MODE)
		,.IO__BOOT_MODE            (IO_PAD__BOOTMODE__Y)
		,.PATCHED__BOOT_MODE       (PATCHED__BOOT_MODE)
		,.GLOBAL__CLK__OSC         (CLK__SRC__OSC)
		,.DBG_0__RSTNSRC__DBG      (RSTN__DEBUG_NDRESET)
		,.WDT_0__RSTNSRC__WDT      (WDT_0__RSTREQN)
		,.PCIE_0__RSTNSRC__HOTRESET(1'h1)
		,.DEBUG_0__RSTN__JTAG      (CPU_0__RSTN__JTAG)
		,.DEBUG_0__CLK__JTAG       (CPU_0__CLK__JTAG)
		,.GLOBAL__RSTN__OSC        (SystemCRG__RESET_INVERTER__GLOBAL__RSTN__OSC)
		,.RSTN__COLDRESET          (RSTN__COLDRESET)
		,.SB__RESET_REASON         (mainbus_subsystem__SystemCRG__auto_RheaMAINBUSSubsystem_SCU_sfrWrapper_custom_bridge_in_1_io)
		,.BISR_0__CLK              ()
		,.BISR_0__RSTN             ()
		,.BISR_0__DONE             (1'h1)
		,.BISR_0__GO               (1'h1)
		,.POR_0__PowerGood         (POR_0__SystemCRG__SYS)
	);

	SEMIFIVE_PRIMITIVE_INV
	RESET_INVERTER (
		 .A(SystemCRG__RESET_INVERTER__GLOBAL__RSTN__OSC)
		,.Y(RESET_INVERTER__mainbus_subsystem__Y)
	);

	sf_por1452xc_ln14lpp
	POR_0 (
		 .PD (1'h0)
		,.SYS(POR_0__SystemCRG__SYS)
	);

	SEMIFIVE_PRIMITIVE_BUFFER
	IO_PAD__PORN_BUF (
		 .A(IO_PAD__PORN__Y)
		,.Y(IO_PAD__RSTNOUT__A)
	);

`endif // SEMIFIVE_MAKE_BLACKBOX_mainbus_subsystem
endmodule
