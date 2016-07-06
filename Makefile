BIN = $(DESTDIR)/usr/bin

.PHONY: all clean distclean install

all: hello-cpp

hello-cpp:
	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o hello-cpp hello.cpp

clean: distclean

distclean:
	rm -f hello-cpp

install: all
	install -d $(BIN)
	install ./hello-cpp $(BIN)
