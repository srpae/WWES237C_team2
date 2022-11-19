dict set slaves control {ports {sample_real {type io_ap_memory width 64} sample_imag {type io_ap_memory width 64} ap_start {type ap_ctrl width 1} ap_done {type ap_ctrl width 1} ap_ready {type ap_ctrl width 1} ap_idle {type ap_ctrl width 1}} mems {sample_real {width 64} sample_imag {width 64}} has_ctrl 1}
set datawidth 32
set addrwidth 64
set intr_clr_mode COR
