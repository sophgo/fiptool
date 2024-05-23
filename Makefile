
ifeq ($(BOARD),64M)
	OPT=--fsbl data/fsbl/cv180x.bin
else

ifeq ($(BOARD),256M)
	OPT=--fsbl data/fsbl/cv181x.bin
else
	OPT=--fsbl data/fsbl/cv180x.bin
endif

endif
all:
	@echo "build fip for board: ${BOARD}"
	./fiptool \
		${OPT} \
		--ddr_param data/ddr_param.bin \
		--opensbi data/fw_dynamic.bin \
		--uboot data/u-boot.bin \
		--rtos data/cvirtos.bin
