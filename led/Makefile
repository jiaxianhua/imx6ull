# make TARGET=red
# make TARGET=green
# make TARGET=blue

TARGET ?= red

TARGET:
	make $(TARGET).bin
	cd ../part_1/download_tool/ && ./mkimage.sh ../../led/$(TARGET).bin

%.o: %.s
	arm-none-eabi-gcc -o $@ -c $< 

%.elf: %.o
	arm-none-eabi-ld -Ttext 0x80000000 -o $@ $<

%.bin: %.elf
	arm-none-eabi-objcopy -O binary $< $@

.PHONY: all clean

clean:
	$(RM) *.o *.elf *.bin

