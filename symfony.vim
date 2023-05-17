" write namespace in symfony project
" from will be 4 if project is in http dir and 5 in symfony dir
function! NamespaceSymfony(from)
    echo    a:from
    let len = len(getcwd())
    let first = split(getcwd(), "/")

    let c = a:from
    let second = "App\\"

    while c < len(first)
        let second .= first[c]
        if c < len(first)-1
            let second .= "\\"
        endif
        let c += 1
    endwhile

    let second .= ";"

    execute "normal inamespace " . second . "\<CR>\<CR>\<Esc>"

endfunction
command! -nargs=* Nss :call NamespaceSymfony(<f-args>)
"/srv/http/symfony
nnoremap <silent><Leader>nss :call NamespaceSymfony(5)<CR>
"/srv/http
nnoremap <silent><Leader>nsh :call NamespaceSymfony(4)<CR>

function! Namespacewithsymfony()
    let len = len(getcwd())
    let first = split(getcwd(), "/")
    let lenfirst = len(first)

    if first[2] == 'tests' || first[3] == 'tests'
        let second = "Tests\\"
    else
        let second = "App\\"
    endif

    if lenfirst > 4
        if first[2] == 'symfony'
            let c = 5
        else
            let c = 4
        endif

        while c < len(first)
            let second .= first[c]
            if c < len(first)-1
                let second .= "\\"
            endif
            let c += 1
        endwhile

        let second .= ";"

        execute "normal inamespace " . second . "\<CR>\<CR>\<Esc>"
    endif

endfunction
