BIN = $(DESTDIR)/usr/bin


.PHONY: all test clean distclean install tarball

all: hello-cpp

hello-cpp:
	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o hello-cpp hello.cpp

test: hello-cpp
	python ./test.py

clean: distclean

distclean:
	rm -f hello-cpp

install: all
	install -d $(BIN)
	install ./hello-cpp $(BIN)

tarball: TARGETDIR = ./$(notdir $(CURDIR))/
tarball: CURRENT_VERSION = $(shell git describe --tags)
tarball: distclean
	(cd .. && tar cvfz ./hello-cpp_$(CURRENT_VERSION).tar.gz $(TARGETDIR) --exclude=".git")
