-include ../../Rules.make

.PHONY: all clean

#All Target
all:
	@echo ======================
	@echo   Building dhrystone 
	@echo ======================
	@cd dhrystone/Debug; make; cd ..
	@echo ====================
	@echo   Building linpack
	@echo ====================
	@cd linpack/Debug; make; cd ..
	@echo ======================
	@echo   Building whetstone
	@echo ======================
	@cd whetstone/Debug; make; cd ..

clean:
	@echo ======================
	@echo   Cleaning dhrystone
	@echo ======================
	@cd dhrystone/Debug; make clean; cd ..
	@echo ====================
	@echo   Cleaning linpack
	@echo ====================
	@cd linpack/Debug; make clean; cd ..
	@echo ======================
	@echo   Cleaning whetstone
	@echo ======================
	@cd whetstone/Debug; make clean; cd ..
	@rm -f `find . -name "*.map"`

install:
	@echo ======================
	@echo  Installing dhrystone
	@echo ======================
	@cp dhrystone/Debug/dhrystone.elf $(DESTDIR)/usr/bin/dhrystone
	@echo ====================
	@echo  Installing linpack
	@echo ====================
	@cp linpack/Debug/linpack.elf $(DESTDIR)/usr/bin/linpack
	@echo ======================
	@echo  Installing whetstone
	@echo ======================
	@cp whetstone/Debug/whetstone.elf $(DESTDIR)/usr/bin/whetstone
	@echo ======================
	@echo   Installing scripts
	@echo ======================
	@cp scripts/* $(DESTDIR)/usr/bin/
