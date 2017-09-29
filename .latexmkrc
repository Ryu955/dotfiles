$latex = 'uplatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';
$bibtex = 'upbibtex';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;
$pvc_view_file_via_temporary = 0;
$pdf_previewer = 'open -ga /Applications/Skim.app';
