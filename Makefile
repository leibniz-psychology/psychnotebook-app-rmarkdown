PREFIX:=/usr/local
R_PREFIX:=/usr/local

# guix patches desktop files itself
install: startrmarkdown org.psychnotebook.rmarkdown.desktop
	install -d $(PREFIX)/bin $(PREFIX)/share/applications $(PREFIX)/share/icons/hicolor/scalable/apps
	install -m 755 startrmarkdown $(PREFIX)/bin/
	install -m 644 -D org.psychnotebook.rmarkdown.desktop $(PREFIX)/share/applications/
	install -m 644 -D rmarkdown.svg $(PREFIX)/share/icons/hicolor/scalable/apps/

startrmarkdown: startrmarkdown.in
	m4 -DR_PREFIX=$(R_PREFIX) < $< > $@

