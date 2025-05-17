TOP = top
DEVICE = up5k
PACKAGE = sg48
SYNTH = yosys
PNR = nextpnr-ice40
PROGRAMMER = iceprog

$(TOP).bin: $(TOP).v uart_rx.v seven_seg_decoder.v
	$(SYNTH) -p "synth_ice40 -top $(TOP) -json $(TOP).json" $^
	$(PNR) --$(DEVICE) --package $(PACKAGE) --json $(TOP).json --pcf constraints.pcf --asc $(TOP).asc
	icepack $(TOP).asc $(TOP).bin

flash: $(TOP).bin
	$(PROGRAMMER) $(TOP).bin

clean:
	rm -f *.json *.asc *.bin
