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
	./_tasks/deploy

new:
	./_tasks/new


# Vendors
vendors:
	braid update _vendor/docstyle

# Cleanup
clean: clean_site
