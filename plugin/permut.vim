"-----------------------------------------------------------------------
"
" File: permut.vim
"
" Swap columns in text divided into columns by arbitrary characters.
"
" Version: 0.2
" Author: JYLM
" Created: 2015-01-05
" Last Change: 2015-01-19
"
"-----------------------------------------------------------------------

"-----------------------------------------------------------------------
" Check some conditions.
"-----------------------------------------------------------------------

if exists('g:permut_loaded') || &cp
    finish
endif
let g:permut_loaded = 1
let g:permut_version = 0.2


"-----------------------------------------------------------------------
" Define a specific command.
"-----------------------------------------------------------------------

command! -range -nargs=+ -bang Permut  <line1>,<line2>call <SID>Permut(<f-args>)


"-----------------------------------------------------------------------
" FUNCTION Permut
"-----------------------------------------------------------------------

function! s:Permut(colnum1, colnum2, ...) range

    if a:0 == 0
        " Default column separator.
        let s:sep = "|"
    else
        let s:sep = a:1
    endif

    " echo "INPUT : colnum1 = " . a:colnum1
    " echo "INPUT : colnum2 = " . a:colnum2
    " echo "INPUT : sep = " . s:sep

    " Make a minimum checking on the input parameters.
    if (a:colnum2 == a:colnum1) || (a:colnum1 < 1) || (a:colnum2 < 1)
        echo "Warning: input parameters of user-defined Permut command are invalid!"
        echo "Please, provide two valid column numbers, and re-try it.!"
        return 0
    endif

    " Walk through the selected lines.
    let linenum = a:firstline
    for line in getline(a:firstline, a:lastline)

        if !(matchstr(line, s:sep) ==# "")

            let line_atoms = []

            " Decompose the current line.
            while len(line)
                let atom = substitute(line, s:sep . ".*", "", "")
                call add(line_atoms, atom)

                let line = substitute(line, atom . s:sep . '\(.*\)', '\1', '')

                if (matchstr(line, s:sep) ==# "")
                    call add(line_atoms, line)
                    break
                endif
            endwhile

            " When at least one column is undetermined, pass it.
            if max([a:colnum1, a:colnum2]) > len(line_atoms)
                echo "Warning: cannot swap the columns in line " . linenum . "!"
                let linenum += 1
                continue
            endif

            " Re-compose the line.
            let new_line = ""
            let atom_num = 1
            for atom in line_atoms
                if (atom_num == a:colnum1)
                    let new_line .= (atom_num == 1 ? "" : s:sep) . line_atoms[a:colnum2 - 1]
                elseif (atom_num == a:colnum2)
                    let new_line .= (atom_num == 1 ? "" : s:sep) . line_atoms[a:colnum1 - 1]
                else
                    let new_line .= (atom_num == 1 ? "" : s:sep) . atom
                endif

                let atom_num += 1
            endfor

            " Replace the current line with the new line in the buffer.
            call setline(linenum, new_line)
        endif

        let linenum += 1
    endfor

    " Invoke another Vim plugin to handle the alignment of columns.
    if exists(":Tabularize") && !exists("g:permut_disable_tabular_usage")
        let align_command = "Tabularize /" . s:sep
        execute align_command
    elseif exists(":EasyAlign") && !exists("g:permut_disable_vim_easy_align_usage")
        let align_command = a:firstline . ',' . a:lastline . " EasyAlign *" . s:sep
        execute align_command
    endif

endfunction


"-----------------------------end-of-file-------------------------------
