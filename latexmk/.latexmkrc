#!/usr/bin/env perl

# Latexmk-pLaTeX の場合（デフォルト）
#   latexmk -gg -pdfdvi foo.tex
# Latexmk-pLaTeX-pdfps の場合
#   latexmk -gg -pdfps foo.tex
# Latexmk-pdfLaTeX の場合
#   latexmk -gg -pdf foo.tex
# Latexmk-LuaLaTeX の場合
#   latexmk -gg -pdflua foo.tex
# Latexmk-XeLaTeX の場合
#   latexmk -gg -pdfxe foo.tex
#
# ref: https://texwiki.texjp.org/?Latexmk

# 注意：PowerShellではファイル名がうまく引き渡せません

# latex共通オプション
$latex_option = '-shell-escape %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error';

# pLaTeX関連 (uplatexを使うならlualatexを使うこと）
$latex     = 'uplatex  ' . $latex_option;
if ($^O eq 'MSWin32') {
    $latex = $latex . ' -kanji=utf8 -no-guess-input-enc ';
}
$latex = $latex . ' %S';
$bibtex    = 'upbibtex %O %B';
$dvipdf    = 'dvipdfmx %O -o %D %S';

# 最近のlatex関連
$lualatex  = 'lualatex ' . $latex_option . ' %S';
$xelatex   = 'xelatex  ' . $latex_option . ' %S';
$pdflatex  = 'pdflatex ' . $latex_option . ' %S';

# p/up/xe/lua共通
$makeindex = 'upmendex %O -o %D %S';

# BibLaTexパッケージ用
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex    = 'bibtexu %O %B';

# dvi, ps変換
$dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf    = 'ps2pdf %O %S %D';

$pdf_mode  = 3;
$preview_continuous_mode = 0; # プレビュー継続モードにするには-pvcオプションをつけること
$pvc_view_file_via_temporary = 0;

# pdf/dvi viewer
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "sumatrapdf %S";
}
