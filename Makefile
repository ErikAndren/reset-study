
FILES = synch-reset.vhd

WORK_DIR = "/tmp/work"
MODELSIMINI_PATH = modelsim.ini

CC=vcom
FLAGS=-work $(WORK_DIR) -93 -modelsimini $(MODELSIMINI_PATH)
VLIB=vlib

all: work vhdlfiles

work:
	$(VLIB) $(WORK_DIR)

clean:
	rm -rf *~ rtl_work *.wlf transcript *.bak

vhdlfiles:
	$(CC) $(FLAGS) $(FILES)
