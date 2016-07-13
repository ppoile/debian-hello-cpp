.PHONY: all test clean distclean install tarball

all: hello-cpp

hello-cpp:
	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o hello-cpp hello.cpp

test: hello-cpp
	python ./test.py

clean: distclean

distclean:
	rm -f hello-cpp

install: BIN = $(DESTDIR)/usr/bin
install: all
	install -d $(BIN)
	install ./hello-cpp $(BIN)

tarball: CURRENT_VERSION = $(shell git describe --tags)
tarball: TARGETDIR = ./$(notdir $(CURDIR))/
tarball: distclean
	(cd .. && tar cvfz ./hello-cpp_$(CURRENT_VERSION).tar.gz $(TARGETDIR) --exclude=".git")
