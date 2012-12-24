if exists('g:loaded_hl_matchit')
  finish
endif
let g:loaded_hl_matchit = 1

let s:save_cpo = &cpo
set cpo&vim

let s:SPEED_MOST_IMPORTANT = 1
let s:SPEED_DEFAULT = 2


if !exists('g:hl_matchit_hl_groupname')
  let g:hl_matchit_hl_groupname = 'cursorline'
endif
if !exists('g:hl_matchit_speed_level')
  let g:hl_matchit_speed_level = s:SPEED_DEFAULT
endif
if !exists('g:hl_matchit_allow_ft_regexp')
  let g:hl_matchit_allow_ft_regexp = ''
endif




com! HiMatch call hl_matchit#do_highlight()
com! HiMatchOn augroup hl_matchit |exe "au!" | exe "au cursormoved * call hl_matchit#do_highlight()" |  augroup END | doautocmd hl_matchit cursormoved
com! HiMatchOff augroup hl_matchit | exe "au!" | augroup END | match none


if exists('g:hl_matchit_enable_on_vim_startup')
    HiMatchOn
endif

let &cpo = s:save_cpo
unlet s:save_cpo

