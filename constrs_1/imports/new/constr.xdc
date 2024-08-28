set_false_path -from [get_ports serial_plaintext2]
set_false_path -from [get_ports reset2]
set_false_path -through [get_ports serial_ciphertext]
set_false_path -through [get_ports done]
create_clock -period 10.000 -name clock -waveform {0.000 5.000} [get_ports clock]



set_property PACKAGE_PIN E3 [get_ports clock]

set_property PACKAGE_PIN V10 [get_ports reset2]
set_property PACKAGE_PIN D4 [get_ports serial_ciphertext]
set_property PACKAGE_PIN C4 [get_ports serial_plaintext2]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports reset2]
set_property IOSTANDARD LVCMOS33 [get_ports serial_ciphertext]
set_property IOSTANDARD LVCMOS33 [get_ports serial_plaintext2]

set_property IOSTANDARD LVCMOS33 [get_ports done]
set_property PACKAGE_PIN V11 [get_ports done]
