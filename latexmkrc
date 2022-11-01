# If zero, do NOT generate a pdf version of the document. If equal to 1, generate a pdf version of the document using
# pdflatex, using the command specified by the $pdflatex variable. If equal to 2, generate a pdf version of the document
# from the ps file, by using the command specified by the $ps2pdf variable. If equal to 3, generate a pdf version of the
# document from the dvi file, by using the command specified by the $dvipdf variable. If equal to 4, generate a pdf
# version of the document using lualatex, using the command specified by the $lualatex variable. If equal to 5, generate
# a pdf version (and an xdv version) of the document using xelatex, using the commands specified by the $xelatex and
# xdvipdfmx variables.
$pdf_mode = 1;
#$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error';
#$xelatex = 'xelatex %O %S';
$biber = 'biber --validate-datamodel --isbn-normalise %O %S';
ensure_path('TEXINPUTS', './definitions//');
ensure_path('TEXINPUTS', '../definitions//');

set_tex_cmds("-shell-escape -synctex=1 -interaction=batchmode -file-line-error %O %S");

$aux_dir = './out/';
$out_dir = './out/';

$show_time = 1;