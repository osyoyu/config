au BufRead,BufNewFile *.coffee if &ft == '' | setfiletype coffee | endif
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
