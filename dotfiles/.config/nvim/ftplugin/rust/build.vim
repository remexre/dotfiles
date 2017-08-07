function! RustBuild(type)
	w
	:execute ":!cargo " . a:type . " --all"
endfunction

nnoremap <leader>lb :call RustBuild("build")<cr>
nnoremap <leader>ld :call RustBuild("doc")<cr>
nnoremap <leader>ll :call RustBuild("check")<cr>
nnoremap <leader>lr :call RustBuild("build --release")<cr>
nnoremap <leader>lt :call RustBuild("test")<cr>
