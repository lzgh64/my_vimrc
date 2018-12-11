"
" map for Normal Visual OperatorPending

"
" nmap for Normal
nnoremap <C-b> /[)\]}]<CR>
nnoremap <TAB> <ESC>>>
nnoremap <S-TAB> <ESC><<

"
" vmap for Visual

"
" omap for OperatorPending

"
" map! for InsertOnly CommandLine

"
" imap for InsertOnly
inoremap <C-l> <Right>
inoremap <C-b> <ESC>/[)\]}]<CR>a

inoremap `o <ESC>ko

inoremap <TAB> <C-i>
inoremap <S-TAB> <C-d>

func ReLeftParenthesis()
    if getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == " "
        return "()\<LEFT>"
    else
        return "("
    endif
endfunc
inoremap ( <C-R>=ReLeftParenthesis()<CR>

func ReRightParenthesis()
    if getline('.')[col('.') - 1] == ')'
        return "\<RIGHT>"
    else
        return ")"
    endif
endfunc
inoremap ) <C-R>=ReRightParenthesis()<CR>

func ReLeftBrace()
    if getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == " "
        return "{}\<LEFT>"
    else
        return "{"
    endif
endfunc
inoremap { <C-R>=ReLeftBrace()<CR>

func ReRightBrace()
    if getline('.')[col('.') - 1] == '}'
        return "\<RIGHT>"
    else
        return "}"
    endif
endfunc
inoremap } <C-R>=ReRightBrace()<CR>

func ReLeftSquareBracket()
    if getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == " "
        return "[]\<LEFT>"
    else
        return "["
    endif
endfunc
inoremap [ <C-R>=ReLeftSquareBracket()<CR>

func ReRightSquareBracket()
    if getline('.')[col('.') - 1] == ']'
        return "\<RIGHT>"
    else
        return "]"
    endif
endfunc
inoremap ] <C-R>=ReRightSquareBracket()<CR>

func ReSingleQuotaionMark()
    if getline('.')[col('.') - 1] == "'"
        return "\<RIGHT>"
    elseif getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == ' '
        return "''\<LEFT>"
    endif
    return "'"
endfunc
inoremap ' <C-R>=ReSingleQuotaionMark()<CR>

func ReDoubleQuotaionMark()
    if getline('.')[col('.') - 1] == '"'
        return "\<RIGHT>"
    elseif getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == ' '
        return '""'."\<LEFT>"
    endif
    return '"'
endfunc
inoremap " <C-R>=ReDoubleQuotaionMark()<CR>

func ReEnter()
    if getline('.')[col('.') - 1] == '}' &&
                \ getline('.')[col('.') - 2] == '{'
        return "\<CR>\<CR>\<UP>\<TAB>"
    else
        return "\<CR>"
    endif
endfunc
inoremap <CR> <C-R>=ReEnter()<CR>

func ReBackspace()
    if (getline('.')[col('.') - 1] == '"' && getline('.')[col('.') - 2] == '"') ||
                \ (getline('.')[col('.') - 1] == "'" && getline('.')[col('.') - 2] == "'")
        return "\<BACKSPACE>\<RIGHT>"
    elseif (getline('.')[col('.') - 1] == ')' && getline('.')[col('.') - 2] == '(') ||
                \ (getline('.')[col('.') - 1] == ']' && getline('.')[col('.') - 2] == '[') ||
                \ (getline('.')[col('.') - 1] == '}' && getline('.')[col('.') - 2] == '{')
        return "\<RIGHT>\<BACKSPACE>\<BACKSPACE>"
    endif
    return "\<BACKSPACE>"
endfunc
inoremap <BACKSPACE> <C-R>=ReBackspace()<CR>
inoremap <C-H> <C-R>=ReBackspace()<CR>

"
" cmap for CommandLine
