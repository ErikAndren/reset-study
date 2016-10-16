FILES = FF_w_synch_reset.vhd \
	FF_w_asynch_reset.vhd \
	Top.vhd

WORK_DIR = "/tmp/work"
MODELSIMINI_PATH = modelsim.ini

CC=vcom
FLAGS=-work $(WORK_DIR) -93 -modelsimini $(MODELSIMINI_PATH)
VLIB=vlib

all: work lib vhdlfiles

work:
	$(VLIB) $(WORK_DIR)

clean:
	rm -rf *~ rtl_work *.wlf transcript *.bak

lib:
	@$(MAKE) -C ../Lib -f ../Lib/Makefile

vhdlfiles:
	$(CC) $(FLAGS) $(FILES)
