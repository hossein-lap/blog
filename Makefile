all:
	@tree -X modules/ROOT/pages/ > modules/ROOT/nav.xml
	@./hos-nav-gen modules/ROOT/nav.xml | grep -v '^* ' > modules/ROOT/nav.adoc
