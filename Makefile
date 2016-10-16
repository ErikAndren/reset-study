QUARTUS_PATH=/opt/altera/13.0sp1/quartus

FILES = FF_w_synch_reset.vhd \
	FF_w_asynch_reset.vhd \
	Top.vhd

WORK_DIR = "/tmp/work"
MODELSIMINI_PATH = modelsim.ini

VMAP = vmap
VLIB = vlib
VSIM = vsim
VHDL_CC = vcom

TBTOP=tb

FLAGS=-work $(WORK_DIR) -93 -modelsimini $(MODELSIMINI_PATH)
VLIB=vlib

all: work altera lib vhdlfiles

work:
	$(VLIB) $(WORK_DIR)

altera:
	$(VLIB) /tmp/altera
	$(VMAP) altera /tmp/altera
	$(VHDL_CC) -work altera -2002 \
		-explicit $(QUARTUS_PATH)/eda/sim_lib/altera_primitives_components.vhd \
		-explicit $(QUARTUS_PATH)/eda/sim_lib/altera_primitives.vhd

clean:
	rm -rf *~ rtl_work *.wlf transcript *.bak

lib:
	@$(MAKE) -C ../Lib -f ../Lib/Makefile

vhdlfiles:
	$(VHDL_CC) $(FLAGS) $(FILES)
