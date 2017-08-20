let [plugins, ftplugin] = dein#load_cache_raw(['/Users/Ryuta/.vimrc', '/Users/Ryuta/.vim/rc/dein.toml', '/Users/Ryuta/.vim/rc/dein_lazy.toml'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/Ryuta/.vim/dein'
let g:dein#_runtime_path = '/Users/Ryuta/.vim/dein/.dein'
let &runtimepath = '/Users/Ryuta/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/Ryuta/.vim,/Users/Ryuta/.vim/dein/repos/github.com/elzr/vim-json,/Users/Ryuta/.vim/dein/.dein,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim80,/usr/local/share/vim/vimfiles/after,/Users/Ryuta/.vim/after,/Users/Ryuta/.vim/dein/.dein/after'
filetype off
