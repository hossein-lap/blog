#!/bin/sh

# circle {{{
circle() {
	magick \
		me-temp.png \( \
			+clone \
			-threshold 101% \
			-fill white \
			-draw 'circle \
				%[fx:int(w/2)],%[fx:int(h/2)] \
				%[fx:int(w/2)],%[fx:371+int(h/2)]' \
		\) \
		-channel-fx '| gray=>alpha'\
		me.png

	imshadow.sh me.png
	imtrim.sh me.png
}
# }}}

# square {{{
square() {
	cp me-temp.png me.png
	imshadow.sh me.png
	imtrim.sh me.png
}
# }}}

circle
