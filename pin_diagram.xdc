# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {pedestrian_button}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {pedestrian_button}]
 

# LEDs
set_property PACKAGE_PIN N3 [get_ports {green}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {green}]
set_property PACKAGE_PIN P1 [get_ports {yellow}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {yellow}]
set_property PACKAGE_PIN L1 [get_ports {red}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {red}]
	
	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {a}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN W6 [get_ports {b}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN U8 [get_ports {c}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {c}]
set_property PACKAGE_PIN V8 [get_ports {d}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {d}]
set_property PACKAGE_PIN U5 [get_ports {e}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {e}]
set_property PACKAGE_PIN V5 [get_ports {f}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {f}]
set_property PACKAGE_PIN U7 [get_ports {g}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {g}]

set_property PACKAGE_PIN U2 [get_ports {ssd_1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_1}]
set_property PACKAGE_PIN U4 [get_ports {ssd_2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_2}]
set_property PACKAGE_PIN V4 [get_ports {ssd_3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_3}]
set_property PACKAGE_PIN W4 [get_ports {ssd_4}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ssd_4}]

##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {lcd_rs_o}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rs_o}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {lcd_rw_o}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rw_o}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {lcd_e_o}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_e_o}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {lcd_db_o[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_db_o[0]}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {lcd_db_o[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_db_o[1]}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {lcd_db_o[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_db_o[2]}]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {lcd_db_o[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {lcd_db_o[3]}]
