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
