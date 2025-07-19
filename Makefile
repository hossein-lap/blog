all:
	@bash manage nav
	@# tree -X modules/ROOT/pages/ > modules/ROOT/nav.xml
	@# ./hos-nav-gen modules/ROOT/nav.xml | grep -v '^* ' > modules/ROOT/nav.adoc

run:
	@bash manage run

stop:
	@bash manage stop
