nmap <LEADER>e :CocCommand explorer<CR>
nmap <LEADER>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
