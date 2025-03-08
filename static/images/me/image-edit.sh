#!/bin/sh

imagemagick-round -i test.png -o neon.png
imagemagick-shadow -i neon.png -o neon.png

# # circle {{{
# circle() {
#     $(which magick || which convert) \
# 		me-temp.png \
#         \( \
# 			+clone \
# 			-threshold 101% \
# 			-fill white \
# 			-draw 'circle \
# 				%[fx:int(w/2)],%[fx:int(h/2)] \
# 				%[fx:int(w/2)],%[fx:371+int(h/2)]' \
# 		\) \
# 		me.png
#
#     convert -scale 80% me-circle.png me-circle.png
#     imagemagick-shadow -i me.png -o me-circle.png
#
# 	# imshadow.sh me.png
# 	# imtrim.sh me.png
#
# }
# # }}}
#
# # square {{{
# square() {
# 	cp me-temp.png me.png
# 	imshadow.sh me.png
# 	imtrim.sh me.png
# }
# # }}}
#
# convert -scale 20% _banner.png banner.png
#
# circle

