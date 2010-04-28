-include DIRS
-include ../../Rules.make

all: debug release

debug:
	for dir in $(DIRS); do \
                make -C $$dir/Debug; \
        done

release:
	for dir in $(DIRS); do \
                make -C $$dir/Release; \
	done

clean:
	for dir in $(DIRS); do \
                make -C $$dir/Release clean; \
                make -C $$dir/Debug clean; \
	done
	@rm -f `find . -name "*.map"`

install:
	@if [ -e dhrystone/Debug/dhrystone ] ; then \
		cp dhrystone/Debug/dhrystone $(DESTDIR)/usr/bin/ ; \
	else \
		if [ -e dhrystone/Release/dhrystone ] ; then \
			cp dhrystone/Release/dhrystone $(DESTDIR)/usr/bin/ ; \
		else \
			echo "Nothing found to install!" ; \
		fi \
	fi
	@if [ -e whetstone/Debug/whetstone ] ; then \
		cp whetstone/Debug/whetstone $(DESTDIR)/usr/bin/ ; \
	else \
		if [ -e whetstone/Release/whetstone ] ; then \
			cp whetstone/Release/whetstone $(DESTDIR)/usr/bin/ ; \
		else \
			echo "Nothing found to install!" ; \
		fi \
	fi
	@if [ -e linpack/Debug/linpack ] ; then \
		cp linpack/Debug/linpack $(DESTDIR)/usr/bin/ ; \
	else \
		if [ -e linpack/Release/linpack ] ; then \
			cp linpack/Release/linpack $(DESTDIR)/usr/bin/ ; \
		else \
			echo "Nothing found to install!" ; \
		fi \
	fi

	@cp scripts/* $(DESTDIR)/usr/bin
