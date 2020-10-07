//*****************************************************************************
//    # #              Name   : qwi12_petaled.sv
//  #     #            Date   : Sep. 05, 2020
// #    #  #  #     #  Author : Qiwei Wu
//  #     #  # #  # #  Version: 1.0
//    # #  #    #   #
// This module is the top wrapper of qwi12_petaled project.
//*****************************************************************************

module qwi12_petaled
(
   // DDR interface
   inout     [14:0]   DDR_addr,
   inout     [2:0]    DDR_ba,
   inout              DDR_cas_n,
   inout              DDR_ck_n,
   inout              DDR_ck_p,
   inout              DDR_cke,
   inout              DDR_cs_n,
   inout     [3:0]    DDR_dm,
   inout     [31:0]   DDR_dq,
   inout     [3:0]    DDR_dqs_n,
   inout     [3:0]    DDR_dqs_p,
   inout              DDR_odt,
   inout              DDR_ras_n,
   inout              DDR_reset_n,
   inout              DDR_we_n,
   // FIXED_IO interface
   inout              FIXED_IO_ddr_vrn,
   inout              FIXED_IO_ddr_vrp,
   inout     [53:0]   FIXED_IO_mio,
   inout              FIXED_IO_ps_clk,
   inout              FIXED_IO_ps_porb,
   inout              FIXED_IO_ps_srstb,
   // LED
   output    [3:0]    LED
);

//*****************************************************************************
// Parameters
//*****************************************************************************

//*****************************************************************************
// Maps
//*****************************************************************************
system u_system
(
   // DDR interface
   .DDR_addr               ( DDR_addr ),
   .DDR_ba                 ( DDR_ba ),
   .DDR_cas_n              ( DDR_cas_n ),
   .DDR_ck_n               ( DDR_ck_n ),
   .DDR_ck_p               ( DDR_ck_p ),
   .DDR_cke                ( DDR_cke ),
   .DDR_cs_n               ( DDR_cs_n ),
   .DDR_dm                 ( DDR_dm ),
   .DDR_dq                 ( DDR_dq ),
   .DDR_dqs_n              ( DDR_dqs_n ),
   .DDR_dqs_p              ( DDR_dqs_p ),
   .DDR_odt                ( DDR_odt ),
   .DDR_ras_n              ( DDR_ras_n ),
   .DDR_reset_n            ( DDR_reset_n ),
   .DDR_we_n               ( DDR_we_n ),
   // FIXED_IO interface
   .FIXED_IO_ddr_vrn       ( FIXED_IO_ddr_vrn ),
   .FIXED_IO_ddr_vrp       ( FIXED_IO_ddr_vrp ),
   .FIXED_IO_mio           ( FIXED_IO_mio ),
   .FIXED_IO_ps_clk        ( FIXED_IO_ps_clk ),
   .FIXED_IO_ps_porb       ( FIXED_IO_ps_porb ),
   .FIXED_IO_ps_srstb      ( FIXED_IO_ps_srstb ),
   // LED
   .GPIO_tri_o             ( LED[0] )
);

endmodule
