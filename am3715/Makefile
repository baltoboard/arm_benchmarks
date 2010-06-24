-include DIRS
-include ../../../Rules.make

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

install: all
	@install -d $(DESTDIR)/usr/bin
	@if [ -e dhrystone/Release/dhrystone ] ; then \
		install dhrystone/Release/dhrystone $(DESTDIR)/usr/bin/ ; \
	else \
		if [ -e dhrystone/Debug/dhrystone ] ; then \
			install dhrystone/Debug/dhrystone $(DESTDIR)/usr/bin/ ; \
		else \
			echo "Nothing found to install!" ; \
		fi \
	fi
	@if [ -e whetstone/Release/whetstone ] ; then \
		install whetstone/Release/whetstone $(DESTDIR)/usr/bin/ ; \
	else \
		if [ -e whetstone/Debug/whetstone ] ; then \
			install whetstone/Debug/whetstone $(DESTDIR)/usr/bin/ ; \
		else \
			echo "Nothing found to install!" ; \
		fi \
	fi
	@if [ -e linpack/Release/linpack ] ; then \
		install linpack/Release/linpack $(DESTDIR)/usr/bin/ ; \
	else \
		if [ -e linpack/Debug/linpack ] ; then \
			install linpack/Debug/linpack $(DESTDIR)/usr/bin/ ; \
		else \
			echo "Nothing found to install!" ; \
		fi \
	fi
	@install scripts/* $(DESTDIR)/usr/bin
