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

# LaTeX本体のための設定
## 各LaTeXに共通するオプション
$latex_option = '%O -shell-escape -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
if ($^O eq 'MSWin32') {
    $latex_option = $latex_option . ' -kanji=utf8 -no-guess-input-enc';
}
## platex/uplatex関連 (uplatexを使うならlualatexを使うこと）
$latex_prefix = 'p'; # 'p' or 'up'
$latex     = $latex_prefix . 'latex' . $latex_option;
## pdf/lua/xelatex関連
$pdflatex  = 'pdflatex ' . $latex_option;
$lualatex  = 'lualatex ' . $latex_option;
$xelatex   = 'xelatex  ' . $latex_option;

# 関連ツールの設定
## 索引作成
$makeindex = 'upmendex %O -o %D %S';
## 参考文献
# $bibtex    = $latex_prefix . 'bibtex %O %B';       # u/uplatex用
$bibtex    = 'bibtexu %O %B';
$biber     = 'biber %O --bblenoding=utf8 -u -U --output_safechars %B'; # BibLaTex用
# dvi/ps/pdf変換
$dvipdf    = 'dvipdfmx %O -o %D %S';
$dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf    = 'ps2pdf %O %S %D';
# pdf/dviプレビュー関連
$pdf_mode  = 3;
$preview_continuous_mode = 1;
$pvc_view_file_via_temporary = 0;
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
