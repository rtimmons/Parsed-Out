DOCSTYLE_SRC=http://releases.ganon.com/docstyle.tar.gz
VENDORS=_vendor/docstyle

# Site:
.PHONY: clean_site site

site: clean_site
	rjekyll

clean_site:
	rm -rf _site


# Tasks:
.PHONY: stage deploy now

stage: site
	./_tasks/stage

deploy: site
	./_tasks/site

new:
	./_tasks/new


# Vendors
.PHONY: vendors clean_vendors

vendors: ${VENDORS}

clean_vendors:
	rm -rf _vendor/*

_vendor/docstyle: _vendor/docstyle.tar.gz
	mkdir -p _vendor
	tar xzf _vendor/docstyle.tar.gz -C _vendor

_vendor/docstyle.tar.gz:
	mkdir -p _vendor
	wget ${DOCSTYLE_SRC} -O _vendor/docstyle.tar.gz


# Cleanup
clean: clean_site clean_vendors
