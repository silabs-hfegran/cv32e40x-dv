//
// Copyright 2023 Silicon Labs, Inc.
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://solderpad.org/licenses/
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

`ifndef __UVMT_CV32E40X_BASE_TEST_CONSTANTS_SV__
`define __UVMT_CV32E40X_BASE_TEST_CONSTANTS_SV__


parameter uvme_cv32e40x_sys_default_clk_period   =  1_500; // 10ns
parameter uvme_cv32e40x_debug_default_clk_period = 10_000; // 10ns

// For RVFI/RVVI
parameter ILEN = 32;
parameter XLEN = 32;
parameter RVFI_NRET = 1;

// For OBI
parameter ENV_PARAM_INSTR_ADDR_WIDTH  = 32;
parameter ENV_PARAM_INSTR_DATA_WIDTH  = 32;
parameter ENV_PARAM_INSTR_ACHK_WIDTH  = 12;
parameter ENV_PARAM_INSTR_RCHK_WIDTH  = 5;
parameter ENV_PARAM_DATA_ADDR_WIDTH   = 32;
parameter ENV_PARAM_DATA_DATA_WIDTH   = 32;
parameter ENV_PARAM_DATA_ACHK_WIDTH   = 12;
parameter ENV_PARAM_DATA_RCHK_WIDTH   = 5;
parameter ENV_PARAM_RAM_ADDR_WIDTH    = 22;

parameter ENV_PARAM_INSTR_AUSER_WIDTH = 0;//`UVMA_OBI_MEMORY_AUSER_DEFAULT_WIDTH;
parameter ENV_PARAM_INSTR_WUSER_WIDTH = 0;//`UVMA_OBI_MEMORY_WUSER_DEFAULT_WIDTH;
parameter ENV_PARAM_INSTR_RUSER_WIDTH = 0;//`UVMA_OBI_MEMORY_RUSER_DEFAULT_WIDTH;
parameter ENV_PARAM_INSTR_ID_WIDTH    = 0;//`UVMA_OBI_MEMORY_ID_DEFAULT_WIDTH;

parameter ENV_PARAM_DATA_AUSER_WIDTH = 0;//`UVMA_OBI_MEMORY_AUSER_DEFAULT_WIDTH;
parameter ENV_PARAM_DATA_WUSER_WIDTH = 0;//`UVMA_OBI_MEMORY_WUSER_DEFAULT_WIDTH;
parameter ENV_PARAM_DATA_RUSER_WIDTH = 0;//`UVMA_OBI_MEMORY_RUSER_DEFAULT_WIDTH;
parameter ENV_PARAM_DATA_ID_WIDTH    = 0;//`UVMA_OBI_MEMORY_ID_DEFAULT_WIDTH;
// Control how often to print core scoreboard checked heartbeat messages
parameter PC_CHECKED_HEARTBEAT = 10_000;

// Map the virtual peripheral registers
parameter CV_VP_REGISTER_BASE          = 32'h0080_0000;
parameter CV_VP_REGISTER_SIZE          = 32'h0000_1000;

parameter CV_VP_VIRTUAL_PRINTER_OFFSET = 32'h0000_0000;
parameter CV_VP_RANDOM_NUM_OFFSET      = 32'h0000_0040;
parameter CV_VP_CYCLE_COUNTER_OFFSET   = 32'h0000_0080;
parameter CV_VP_STATUS_FLAGS_OFFSET    = 32'h0000_00c0;
parameter CV_VP_FENCEI_TAMPER_OFFSET   = 32'h0000_0100;
parameter CV_VP_INTR_TIMER_OFFSET      = 32'h0000_0140;
parameter CV_VP_DEBUG_CONTROL_OFFSET   = 32'h0000_0180;
parameter CV_VP_OBI_SLV_RESP_OFFSET    = 32'h0000_01c0;
parameter CV_VP_SIG_WRITER_OFFSET      = 32'h0000_0200;

parameter CV_VP_VIRTUAL_PRINTER_BASE   = CV_VP_REGISTER_BASE + CV_VP_VIRTUAL_PRINTER_OFFSET;
parameter CV_VP_RANDOM_NUM_BASE        = CV_VP_REGISTER_BASE + CV_VP_RANDOM_NUM_OFFSET;
parameter CV_VP_CYCLE_COUNTER_BASE     = CV_VP_REGISTER_BASE + CV_VP_CYCLE_COUNTER_OFFSET;
parameter CV_VP_STATUS_FLAGS_BASE      = CV_VP_REGISTER_BASE + CV_VP_STATUS_FLAGS_OFFSET;
parameter CV_VP_INTR_TIMER_BASE        = CV_VP_REGISTER_BASE + CV_VP_INTR_TIMER_OFFSET;
parameter CV_VP_DEBUG_CONTROL_BASE     = CV_VP_REGISTER_BASE + CV_VP_DEBUG_CONTROL_OFFSET;
parameter CV_VP_OBI_SLV_RESP_BASE      = CV_VP_REGISTER_BASE + CV_VP_OBI_SLV_RESP_OFFSET;
parameter CV_VP_SIG_WRITER_BASE        = CV_VP_REGISTER_BASE + CV_VP_SIG_WRITER_OFFSET;
parameter CV_VP_FENCEI_TAMPER_BASE     = CV_VP_REGISTER_BASE + CV_VP_FENCEI_TAMPER_OFFSET;



`ifdef PARAM_SET_0
   `include  "cvverif_param_set_0.svh"
`elsif PARAM_SET_1
   `include  "cvverif_param_set_1.svh"
`endif


// Debug

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif DBG_NUM_TRIG_0
   parameter CORE_PARAM_DBG_NUM_TRIGGERS = 0;
`elsif DBG_NUM_TRIG_1
   parameter CORE_PARAM_DBG_NUM_TRIGGERS = 1;
`elsif DBG_NUM_TRIG_2
   parameter CORE_PARAM_DBG_NUM_TRIGGERS = 2;
`elsif DBG_NUM_TRIG_3
   parameter CORE_PARAM_DBG_NUM_TRIGGERS = 3;
`elsif DBG_NUM_TRIG_4
   parameter CORE_PARAM_DBG_NUM_TRIGGERS = 4;
`else
   parameter CORE_PARAM_DBG_NUM_TRIGGERS = 1;
`endif


// CLIC

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif CLIC_EN
   parameter int CORE_PARAM_CLIC = 1;
`else
   parameter int CORE_PARAM_CLIC = 0;
`endif
parameter logic CLIC = CORE_PARAM_CLIC;

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`else
   parameter int  CORE_PARAM_CLIC_ID_WIDTH = 5;
`endif


// A-ext

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif ZALRSC
   parameter cv32e40x_pkg::a_ext_e CORE_PARAM_A_EXT = cv32e40x_pkg::ZALRSC;
`elsif A
   parameter cv32e40x_pkg::a_ext_e CORE_PARAM_A_EXT = cv32e40x_pkg::A;
`else
   parameter cv32e40x_pkg::a_ext_e CORE_PARAM_A_EXT = cv32e40x_pkg::A_NONE;
`endif


// B-ext

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif ZBA_ZBB_ZBS
   parameter cv32e40x_pkg::b_ext_e CORE_PARAM_B_EXT = cv32e40x_pkg::ZBA_ZBB_ZBS;
`elsif ZBA_ZBB_ZBC_ZBS
   parameter cv32e40x_pkg::b_ext_e CORE_PARAM_B_EXT = cv32e40x_pkg::ZBA_ZBB_ZBC_ZBS;
`else
   parameter cv32e40x_pkg::b_ext_e CORE_PARAM_B_EXT = cv32e40x_pkg::B_NONE;
`endif


// I-base & E-base

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif RV32E
   parameter cv32e40x_pkg::rv32_e CORE_PARAM_RV32              = cv32e40x_pkg::RV32E;
   parameter                      CORE_PARAM_REGFILE_NUM_WORDS = 16;
`else
   parameter cv32e40x_pkg::rv32_e CORE_PARAM_RV32              = cv32e40x_pkg::RV32I;
   parameter                      CORE_PARAM_REGFILE_NUM_WORDS = 32;
`endif


// Event Counters

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif SET_NUM_MHPMCOUNTERS
  parameter int CORE_PARAM_NUM_MHPMCOUNTERS = `SET_NUM_MHPMCOUNTERS;
`else
  parameter int CORE_PARAM_NUM_MHPMCOUNTERS = 1;
`endif


// PMA

parameter int  PMA_MAX_REGIONS = 16;

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`elsif PMA_CUSTOM_CFG
   const string pma_cfg_name = "pma_custom_cfg";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h1A11_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h1A11_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 3;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
      // Overlap "shadow" of main code (.text), for testing overlap priority
      cv32e40x_pkg::pma_cfg_t'{
         word_addr_low  : '0,
         word_addr_high : ('h 1a11_0800 + 'd 16) >> 2,  // should be identical to the prioritized region below
         main           : 0,  // Would stop all execution, but should be overruled
         bufferable     : 0,
         cacheable      : 0,
         atomic         : 0},
      // Main code (.text) is executable up til into dbg region
      cv32e40x_pkg::pma_cfg_t'{
         word_addr_low  : '0,
         word_addr_high : ('h 1a11_0800 + 'd 16) >> 2,  // "dbg" address plus arbitrary offset to have a known usable area
         main           : 1,
         bufferable     : 1,
         cacheable      : 1,
         atomic         : 1},
      // Second portion of dbg up til end is exec
      cv32e40x_pkg::pma_cfg_t'{
         word_addr_low  : 'h 1A11_1000 >> 2,  // after ".debugger"
         word_addr_high : 'h FFFF_FFFF,
         main           : 1,
         bufferable     : 0,
         cacheable      : 0,
         atomic         : 1}
      };
`elsif PMA_DEBUG_CFG
   const string pma_cfg_name = "pma_debug_cfg";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h1A11_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h1A11_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 2;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
      // Everything is initially executable
      cv32e40x_pkg::pma_cfg_t'{
         word_addr_low  : '0,
         word_addr_high : 'h FFFF_FFFF,
         main           : 1,
         bufferable     : 0,
         cacheable      : 0,
         atomic         : 1},
      // A small region below "dbg" is forbidden to facilitate pma exception testing
      cv32e40x_pkg::pma_cfg_t'{
         word_addr_low  : ('h 1a11_0800 - 'd 16) >> 2,
         word_addr_high : 'h 1a11_0800 >> 2,
         main           : 0,
         bufferable     : 0,
         cacheable      : 0,
         atomic         : 0}
      };
`elsif PMA_TEST_CFG_1
   const string pma_cfg_name = "pma_test_cfg_1";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h1A11_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h1A11_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 1;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[0:CORE_PARAM_PMA_NUM_REGIONS-1] = '{
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h7FFF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1}
   };
`elsif PMA_TEST_CFG_2
   const string pma_cfg_name = "pma_test_cfg_2";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h1A11_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h1A11_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 7;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
     '{word_addr_low : 32'hE010_0000>>2, word_addr_high : 32'hFFFF_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'hE000_0000>>2, word_addr_high : 32'hE00F_FFFF>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'hA000_0000>>2, word_addr_high : 32'hDFFF_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h6000_0000>>2, word_addr_high : 32'h9FFF_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h4000_0000>>2, word_addr_high : 32'h5FFF_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h2000_0000>>2, word_addr_high : 32'h3FFF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h1FFF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1}
     };
`elsif PMA_TEST_CFG_3
   const string pma_cfg_name = "pma_test_cfg_3";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h1A11_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h1A11_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 16;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
     '{word_addr_low : 32'h0000_A000>>2, word_addr_high : 32'hFFFE_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h0200_0000>>2, word_addr_high : 32'hEFFF_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h0500_0000>>2, word_addr_high : 32'h8459_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h1000_00F1>>2, word_addr_high : 32'h82FF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h13AC_AA55>>2, word_addr_high : 32'h7FFF_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h2000_0000>>2, word_addr_high : 32'h63FF_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h2340_000A>>2, word_addr_high : 32'h600F_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h2A00_0000>>2, word_addr_high : 32'h56FF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h2C5A_3200>>2, word_addr_high : 32'h52FF_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h3000_1353>>2, word_addr_high : 32'h5140_FFFF>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h3100_FCAB>>2, word_addr_high : 32'h5000_BCCA>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h3420_C854>>2, word_addr_high : 32'h5000_ABFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h3600_A000>>2, word_addr_high : 32'h4F99_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h3ACE_0000>>2, word_addr_high : 32'h4ABC_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h4400_0000>>2, word_addr_high : 32'h4BFF_FFFF>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h4800_0000>>2, word_addr_high : 32'h49FF_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1}
     };
`elsif PMA_TEST_CFG_4
   const string pma_cfg_name = "pma_test_cfg_4";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h3201_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h3201_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 16;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
     '{word_addr_low : 32'hE700_EF00>>2, word_addr_high : 32'hE9FF_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'hC000_0000>>2, word_addr_high : 32'hDFFF_FFFF>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'hBC00_0000>>2, word_addr_high : 32'hBCFF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'hA000_0000>>2, word_addr_high : 32'hAFFF_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h6300_0000>>2, word_addr_high : 32'h6700_FFFF>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h5400_0000>>2, word_addr_high : 32'h5FFF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h5100_0000>>2, word_addr_high : 32'h52FF_FFFF>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h4D00_5555>>2, word_addr_high : 32'h4FFF_ABCD>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h4AAA_F000>>2, word_addr_high : 32'h4C00_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h3440_0000>>2, word_addr_high : 32'h3800_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h3100_A000>>2, word_addr_high : 32'h32FF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h2020_0010>>2, word_addr_high : 32'h2FFF_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1},
     '{word_addr_low : 32'h1800_1234>>2, word_addr_high : 32'h18FF_AB21>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h1000_0000>>2, word_addr_high : 32'h1001_0000>>2, main : 1'b0, bufferable : 1'b1, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0030_0000>>2, word_addr_high : 32'h04FF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h0001_0000>>2, word_addr_high : 32'h001F_FFFF>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b1}
     };
`elsif PMA_TEST_CFG_5
   const string pma_cfg_name = "pma_test_cfg_5";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h0030_1000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h0030_2000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 16;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'hFFFF_FFFF>>2, main : 1'b1, bufferable : 1'b1, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h1249_2492>>2, word_addr_high : 32'h1249_2492>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'hDB6D_B6DB>>2, word_addr_high : 32'hDB6D_B6DB>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h9249_2492>>2, word_addr_high : 32'h9249_2492>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'hFFFF_FFFF>>2, word_addr_high : 32'hFFFF_FFFF>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'hE38E_E38E>>2, word_addr_high : 32'hE38E_E38E>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'hCCCC_CCCC>>2, word_addr_high : 32'hCCCC_CCCC>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'hAAAA_AAAA>>2, word_addr_high : 32'hAAAA_AAAA>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h5555_5555>>2, word_addr_high : 32'h5555_5555>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0},
     '{word_addr_low : 32'h0000_0000>>2, word_addr_high : 32'h0000_0000>>2, main : 1'b0, bufferable : 1'b0, cacheable : 1'b0, atomic : 1'b0}
     };
`elsif PMA_TEST_CFG_X1 // Used for memory layout generator debug
   const string pma_cfg_name = "pma_test_cfg_x1";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h0030_1000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h0030_2000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 5;

   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[CORE_PARAM_PMA_NUM_REGIONS-1:0] = '{
     '{word_addr_low : 32'h00000000>>2, word_addr_high : 32'h20000000>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h30000000>>2, word_addr_high : 32'h40000000>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h50000000>>2, word_addr_high : 32'h60000000>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h70000000>>2, word_addr_high : 32'h80000000>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1},
     '{word_addr_low : 32'h00000000>>2, word_addr_high : 32'hF0000000>>2, main : 1'b1, bufferable : 1'b0, cacheable : 1'b1, atomic : 1'b1}
     };
`else
   const string pma_cfg_name = "pma_noregion";
   parameter logic [31:0] CORE_PARAM_DM_REGION_START = 32'h1A11_0000;
   parameter logic [31:0] CORE_PARAM_DM_REGION_END   = 32'h1A11_1000;
   parameter int unsigned CORE_PARAM_PMA_NUM_REGIONS = 0;
   parameter cv32e40x_pkg::pma_cfg_t CORE_PARAM_PMA_CFG[-1:0] = '{default:cv32e40x_pkg::PMA_R_DEFAULT};
`endif


// Misc  (Not controlled by any define.)

`ifdef PARAM_SET_0
   // Sat from the include file
`elsif PARAM_SET_1
   // Sat from the include file
`else
   parameter cv32e40x_pkg::m_ext_e  CORE_PARAM_M_EXT           = cv32e40x_pkg::M;  // No defines control this.
   parameter int                    CORE_PARAM_CORE_LOG_ENABLE = 1;                // The default is 1 in the RTL repo.
   parameter int                    CORE_PARAM_DEBUG           = 1;                // Debug is supported by default.
   parameter int                    CORE_PARAM_LIB             = 0;                // "LIB" doesn't matter.
   parameter bit                    CORE_PARAM_X_EXT           = 0;                // Default from RTL repo.
   parameter int unsigned           CORE_PARAM_X_NUM_RS        = 2;                // Default from RTL repo.
   parameter int unsigned           CORE_PARAM_X_ID_WIDTH      = 4;                // Default from RTL repo.
   parameter int unsigned           CORE_PARAM_X_MEM_WIDTH     = 32;               // Default from RTL repo.
   parameter int unsigned           CORE_PARAM_X_RFR_WIDTH     = 32;               // Default from RTL repo.
   parameter int unsigned           CORE_PARAM_X_RFW_WIDTH     = 32;               // Default from RTL repo.
   parameter logic [31:0]           CORE_PARAM_X_MISA          = 32'h 00000000;    // Default from RTL repo.
   parameter logic [1:0]            CORE_PARAM_X_ECS_XS        = 2'b 00;           // Default from RTL repo.
`endif


`endif //__UVMT_CV32E40X_BASE_TEST_CONSTANTS_SV__

