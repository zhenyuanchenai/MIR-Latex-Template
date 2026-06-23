$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=0 -output-directory=build %O %S';
$bibtex = 'bibtex %O %B';
$out_dir = 'build';
$clean_ext = 'bbl run.xml synctex.gz';
$success_cmd = q#powershell -NoProfile -ExecutionPolicy Bypass -Command "try { if (Test-Path -LiteralPath 'build\main.pdf') { Copy-Item -LiteralPath 'build\main.pdf' -Destination 'main.pdf' -Force -ErrorAction Stop; Write-Host 'Copied build/main.pdf to main.pdf' } } catch { Write-Warning 'Cannot update root main.pdf. Close any PDF previewer/Acrobat tab using main.pdf, then compile again.' }"#;
