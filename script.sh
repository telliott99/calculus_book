#! /bin/bash
arg=$1
user="/Users/telliott"
path=$user"/Github/calculus_book"

cd /Users/telliott/Desktop

python $path/combine.py $arg > IF.tex
# once to generate .sty, twice for TOC, 3x for ref nums
pdflatex IF.tex >/dev/null
pdflatex IF.tex >/dev/null
pdflatex IF.tex >/dev/null

#if [ $1 eq "short" ] then title=$title" short"

if [ "$1" = "short" ]
then
    pdf_path=/Best\ of\ Calculus-short.pdf
else
    pdf_path=/Best\ of\ Calculus.pdf
fi

cp IF.pdf "$user/Dropbox/- stuff$pdf_path"
mv IF.pdf "$path$pdf_path"
rm IF.*
sleep 1

osascript -e 'quit app "TeXShop"'

# cleanup random stuff
rm $path/files/*.aux $path/files/*.log 2>/dev/null
rm $path/files/*.out $path/files/*.gz 2>/dev/null
rm $path/files/*.pdf 2>/dev/null
rm stdclsdv.sty 2>/dev/null

open -a Preview "$path$pdf_path"


