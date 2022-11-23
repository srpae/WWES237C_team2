# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
real_sample { 
	dir IO
	width 32
	depth 256
	mode ap_memory
	offset 1024
	offset_end 2047
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
imag_sample { 
	dir IO
	width 32
	depth 256
	mode ap_memory
	offset 2048
	offset_end 3071
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


