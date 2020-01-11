#! /bin/bash
arg=$1
path="/Users/telliott/Github/calculus_book"

cd /Users/telliott/Desktop

python $path/combine.py $arg > IF.tex
# once to generate .sty, twice for TOC, 3x for ref nums
pdflatex IF.tex >/dev/null
pdflatex IF.tex >/dev/null
pdflatex IF.tex >/dev/null

cp IF.pdf "/Users/telliott/Dropbox/@stuff"/Best\ of\ Calculus.pdf
mv IF.pdf $path/Best\ of\ Calculus.pdf
rm IF.*
sleep 1

osascript -e 'quit app "TeXShop"'

# cleanup random stuff
rm $path/files/*.aux $path/files/*.log 2>/dev/null
rm $path/files/*.out $path/files/*.gz 2>/dev/null
rm $path/files/*.pdf 2>/dev/null
rm stdclsdv.sty 2>/dev/null

open -a Preview /Users/telliott/Github/calculus_book/Best\ of\ Calculus.pdf


