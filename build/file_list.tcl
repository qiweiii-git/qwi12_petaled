#add constraints
add_files -fileset constrs_1 -norecurse ../.depend/qwi_base/build/constraints/pinout.xdc

#add source
add_files ../source/qwi12_petaled.sv

#global define
#set_property is_global_include true [get_files define.vh]
