DOCSTYLE_SRC=http://releases.ganon.com/docstyle.tar.gz

.PHONY: vendors clean

vendors: vendor/docstyle

vendor/docstyle: vendor/docstyle.tar.gz
	mkdir -p vendor/docstyle
	tar xzf vendor/docstyle.tar.gz -C vendor/docstyle

vendor/docstyle.tar.gz:
	mkdir -p vendor/docstyle
	wget ${DOCSTYLE_SRC} -O vendor/docstyle.tar.gz

clean:
	rm -rf vendor/*
