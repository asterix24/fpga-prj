# project name
PROJECT=pwm
# vhdl files
FILES = src/pwm.vhdl \
		#
#
# testbench
SIMTOP = pwm_tb
SIMFILES = test/pwm_tb.vhdl

# Simu break condition
GHDL_SIM_OPT    = --assert-level=error
#GHDL_SIM_OPT    = --stop-time=500ns

SIMDIR = simu
SYNTHFILES = bin/bus_led_ise/netgen/synthesis

GHDL_CMD        = ghdl
GHDL_FLAGS      = --ieee=synopsys --warn-no-vital-generic

VIEW_CMD        = /usr/local/bin/gtkwave

all: compile run

compile :
	mkdir -p simu
	$(GHDL_CMD) -i $(GHDL_FLAGS) --workdir=simu --work=work $(SIMFILES) $(FILES)
	$(GHDL_CMD) -m $(GHDL_FLAGS) --workdir=simu --work=work $(SIMTOP)
	@mv $(SIMTOP) simu/$(SIMTOP)
	@rm e~*.o

run :
	@$(SIMDIR)/$(SIMTOP) $(GHDL_SIM_OPT) --vcd=$(SIMDIR)/$(SIMTOP).vcd

view:
	$(VIEW_CMD) $(SIMDIR)/$(SIMTOP).vcd

clean :
	$(GHDL_CMD) --clean --workdir=simu
