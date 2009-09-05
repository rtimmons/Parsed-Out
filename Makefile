DOCSTYLE_SRC=http://releases.ganon.com/docstyle.tar.gz

.PHONY: vendors clean

vendors: _vendor/docstyle

vendor/docstyle: _vendor/docstyle.tar.gz
	mkdir -p _vendor
	tar xzf _vendor/docstyle.tar.gz -C _vendor

vendor/docstyle.tar.gz:
	mkdir -p _vendor
	wget ${DOCSTYLE_SRC} -O _vendor/docstyle.tar.gz

clean:
	rm -rf _vendor/*
