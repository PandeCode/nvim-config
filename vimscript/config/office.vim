let s:lesspipe_cmd = 'LESSQUIET=1 lesspipe.sh'

autocmd Filetype pdf exe '%!' . s:lesspipe_cmd . ' ' . expand('%:S') | setlocal filetype=text nomodifiable readonly |

