let g:unite_source_gtags_result_option = "ctags-mod"
let g:unite_source_gtags_global_cmd = empty($GTAGSGLOBAL) ? "global" : $GTAGSGLOBAL

if !exists("g:unite_source_gtags_unite_source_shell_quote")
  if has("win32") || has("win16") || has("win95")
    let g:unite_source_gtags_shell_quote = '"'
  else
    let g:unite_source_gtags_shell_quote = "'"
  endif
endif
