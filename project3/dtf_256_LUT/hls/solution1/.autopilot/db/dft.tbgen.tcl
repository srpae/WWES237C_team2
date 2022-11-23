set moduleName dft
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {dft}
set C_modelType { void 0 }
set C_modelArgList {
	{ real_sample int 32 regular {axi_slave 2}  }
	{ imag_sample int 32 regular {axi_slave 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "real_sample", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":1024, "out":1024}, "offset_end" : {"in":2047, "out":2047}} , 
 	{ "Name" : "imag_sample", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":2048, "out":2048}, "offset_end" : {"in":3071, "out":3071}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 12 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 12 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"dft","role":"start","value":"0","valid_bit":"0"},{"name":"dft","role":"continue","value":"0","valid_bit":"4"},{"name":"dft","role":"auto_start","value":"0","valid_bit":"7"},{"name":"real_sample","role":"data","value":"1024"},{"name":"imag_sample","role":"data","value":"2048"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"dft","role":"start","value":"0","valid_bit":"0"},{"name":"dft","role":"done","value":"0","valid_bit":"1"},{"name":"dft","role":"idle","value":"0","valid_bit":"2"},{"name":"dft","role":"ready","value":"0","valid_bit":"3"},{"name":"dft","role":"auto_start","value":"0","valid_bit":"7"},{"name":"real_sample","role":"data","value":"1024"},{"name":"imag_sample","role":"data","value":"2048"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "10", "12"],
		"CDFG" : "dft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "393493", "EstimateLatencyMax" : "393493",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_30_3_fu_70", "Port" : "real_sample", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "3", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54", "Port" : "real_sample", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "imag_sample", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_30_3_fu_70", "Port" : "imag_sample", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "3", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54", "Port" : "imag_sample", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54", "Port" : "cos_coefficients_table", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54", "Port" : "sin_coefficients_table", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp_real_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp_imag_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8", "9"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "393232", "EstimateLatencyMax" : "393232",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imag_sample", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_real", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "temp_imag", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_12_1_VITIS_LOOP_18_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54.cos_coefficients_table_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54.sin_coefficients_table_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54.faddfsub_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54.fmul_32ns_32ns_32_4_max_dsp_1_U2", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54.mul_8s_8s_8_1_1_U3", "Parent" : "3"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_fu_54.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_30_3_fu_70", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_30_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "temp_real", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "temp_imag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imag_sample", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_30_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_30_3_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dft {
		real_sample {Type IO LastRead 1 FirstWrite -1}
		imag_sample {Type IO LastRead 1 FirstWrite -1}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}
	dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2 {
		real_sample {Type I LastRead 1 FirstWrite -1}
		imag_sample {Type I LastRead 1 FirstWrite -1}
		temp_real {Type O LastRead -1 FirstWrite 19}
		temp_imag {Type O LastRead -1 FirstWrite 21}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}
	dft_Pipeline_VITIS_LOOP_30_3 {
		temp_real {Type I LastRead 0 FirstWrite -1}
		real_sample {Type O LastRead -1 FirstWrite 1}
		temp_imag {Type I LastRead 0 FirstWrite -1}
		imag_sample {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "393493", "Max" : "393493"}
	, {"Name" : "Interval", "Min" : "393494", "Max" : "393494"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
