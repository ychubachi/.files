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

if ($^O eq 'MSWin32') {
  $latex     = 'platex  %O -synctex=1 -kanji=utf8 -no-guess-input-enc %S';
  $pdflatex  = 'pdflatex %O -synctex=1 %S';
  $lualatex  = 'lualatex %O -synctex=1 %S';
  $xelatex   = 'xelatex -shell-escape %O -synctex=1 %S';
  $biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
  $bibtex    = 'pbibtex %O %B';
  $makeindex = 'pmendex %O -o %D %S';
  $dvipdf    = 'dvipdfmx %O -o %D %S';
  $dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
  $ps2pdf    = 'ps2pdf.exe %O %S %D';
  if (-f 'C:/Program Files/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
  } elsif (-f 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
  } else {
    $pdf_previewer = 'texworks';
  }
} else {
  $latex     = 'platex  -shell-escape %O -synctex=1 %S';
  $pdflatex  = 'pdflatex -shell-escape %O -synctex=1 %S';
  $lualatex  = 'lualatex -shell-escape %O -synctex=1 %S';
  $xelatex   = 'xelatex  -shell-escape %O -synctex=1 %S';
  $biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
  $bibtex    = 'pbibtex %O %B';
  $makeindex = 'upmendex %O -o %D %S';
  $dvipdf    = 'dvipdfmx %O -o %D %S';
  $dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
  $ps2pdf    = 'ps2pdf %O %S %D';
  if ($^O eq 'darwin') {
    $pvc_view_file_via_temporary = 0;
    $pdf_previewer = 'open -ga /Applications/Skim.app';
  } else {
    $pdf_previewer = 'xdg-open';
  }
}

$preview_continuous_mode = 1;

# #!/usr/bin/env perl
# $latex            = 'platex -shell-escape';
# $bibtex           = 'pbibtex';
# $dvipdf           = 'dvipdfmx -o %D %S';
# $max_repeat       = 5;
# $pdf_mode         = 3; # generates pdf via dvipdfmx

# # Prevent latexmk from removing PDF after typeset.
# # This enables Skim to chase the update in PDF automatically.
# $pvc_view_file_via_temporary = 0;

# # Use evince as a previewer
# $pdf_previewer    = "evince";
# $preview_continuous_mode = 1;
