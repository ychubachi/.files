#!/usr/bin/env perl

# Latexmk-upLaTeX の場合（デフォルト）
#   latexmk -gg -pdfdvi foo.tex
# Latexmk-upLaTeX-pdfps の場合
#   latexmk -gg -pdfps foo.tex
# Latexmk-pdfLaTeX の場合
#   latexmk -gg -pdf foo.tex
# Latexmk-LuaLaTeX の場合
#   latexmk -gg -pdflua foo.tex
# Latexmk-XeLaTeX の場合
#   latexmk -gg -pdfxe foo.tex

# ref: https://texwiki.texjp.org/?Latexmk

$latex_option = '-shell-escape %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';

$latex     = 'uplatex  ' . $latex_option;
$pdflatex  = 'pdflatex ' . $latex_option;
$lualatex  = 'lualatex ' . $latex_option;
$xelatex   = 'xelatex  ' . $latex_option;
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex    = 'upbibtex %O %B';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf    = 'dvipdfmx %O -o %D %S';
$dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf    = 'ps2pdf %O %S %D';
$pdf_mode  = 3;
$pdf_previewer = 'evince';
$preview_continuous_mode = 1;
