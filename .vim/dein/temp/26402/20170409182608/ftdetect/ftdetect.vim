autocmd BufNewFile,BufRead *.json setlocal filetype=json
autocmd BufNewFile,BufRead *.jsonp setlocal filetype=json
autocmd BufNewFile,BufRead *.geojson setlocal filetype=json
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
" Rust uses several TOML config files that are not named with .toml.
autocmd BufNewFile,BufRead *.toml,Cargo.lock,.cargo/config set filetype=toml
