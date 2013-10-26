SOURCES=goji_lib_howler.ml
PACKAGE=howler

.PHONY: clean install uninstall

all:  $(PACKAGE)
	cd $(PACKAGE) && make

$(PACKAGE): $(patsubst %.ml, %.cmxs, $(SOURCES))
	goji generate $^

%.cmxs: %.ml
	ocamlfind ocamlopt -package goji_lib -shared $< -o $@

install: $(PACKAGE)
	cd $(PACKAGE) && make install

uninstall: $(PACKAGE)
	cd $(PACKAGE) && make uninstall

clean:
	$(RM) -rf $(PACKAGE)
	$(RM) -rf *~ *.cm* *.o
