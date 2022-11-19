# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
sample_real { 
	dir IO
	width 64
	depth 256
	mode ap_memory
	offset 2048
	offset_end 4095
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
sample_imag { 
	dir IO
	width 64
	depth 256
	mode ap_memory
	offset 4096
	offset_end 6143
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


