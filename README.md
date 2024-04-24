# FIP Generator for Milk-V Series Board

This is a Python-based firmware image package (FIP) generator specifically designed for the Milk-V series board.

## Build

1. Build U-Boot

Take Milk-V Duo as example:

```shell
cd <Your U-Boot Path>
make milkv_duo_defconfig
make
```

After compilation, the u-boot.bin and u-boot.dtb file will be generated.

2. Build OpenSBI

```shell
cd <Your OpenSBI Path>
make PLATFORM=generic FW_FDT_PATH=<Your U-Boot Path>/u-boot.dtb
```

After compilation, the fw_dynamic.bin file will be generated.

3. (Optional) Build RTOS

Choose any RTOS, and after compilation, a bin file will be generated.

4. Pack fip.bin

For Milk-V Duo with CV1800B SoC, use cv180x.bin under fsbl folder as its firt stage bootloader, and for Milk-V Duo256M with SG2002 SoC, use cv181x.bin instead.

```shell
python genfip.py \
    --fsbl fsbl/cv180x.bin \
    --opensbi <Your OpenSBI Path>/fw_dynamic.bin \
    --uboot <Your U-Boot Path>/u-boot.bin \
    --rtos <Any RTOS.bin>
```

## Usage

1. Place the generated fip.bin file into the FAT partition of the SD card.
2. Insert the SD card into the board and power it on.
