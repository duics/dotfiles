"" Remap elm bindings to leader
nnoremap <silent> <leader>m :<C-u>call elm#Make()<CR>
nnoremap <silent> <leader>b :<C-u>call elm#Make("Main.elm")<CR>
nnoremap <silent> <leader>t :<C-u>call elm#Test()<CR>
nnoremap <silent> <leader>r :<C-u>call elm#Repl()<CR>
nnoremap <silent> <leader>e :<C-u>call elm#ErrorDetail()<CR>
nnoremap <silent> <S-k>     :<C-u>call elm#ShowDocs()<CR>
nnoremap <silent> <leader>db :<C-u>call elm#BrowseDocs()<CR>
