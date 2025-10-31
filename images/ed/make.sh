#!/bin/sh

# accent="#8bb158"
# accent="#6fe2e2"
accent="#C5FFFF"

x=192
y=192

imagemagick-string \
    -i '{}' \
    -o foo.png \
    -bg None \
    -fg "${accent}" \
    -fn 'Ubuntu-Mono-Bold' \
    -l ${x} \
    -w ${y} \
    -e "-stroke ${accent} -strokewidth 5"

# cp {foo,bar}.png -v

trim() {
    $(which magick || which convert) \
        ${1} \
        -trim +repage \
        ${2}
}

# imagemagick-shadow -i foo.png -o bar.png -sc none
trim foo.png bar.png
imagemagick-shadow -i bar.png -o bar.png -sc none -sw 500

    #-ps 200
# imagemagick-trim foo.png
# imagemagick-shadow -i foo.png -o foo.png -sc Black

\cp -f ../me/test.png .
$(which magick || which convert) \
    test.png \
    -resize ${x}x${y}^ \
    -fill black -colorize 60% \
    -gravity center \
    -extent ${x}x${y}^ \
    test.png

imagemagick-round -i test.png -o test.png

imagemagick-merge -i 'bar.png test.png' -o bar.png -f 100

# imagemagick-shadow -i foo.png -o foo.png -sw 0 -sc none -bc black -bw 0.02 -sr 0
