function! s:christmas(...) abort
py3 << END
# vim.command("hi %s term=bold gui=bold guifg=%s" % (random.choice(attribs), random.choice(colors)))
[vim.command("hi %s term=bold gui=bold guifg=%s" % (att, random.choice(colors))) for att in attribs + bg]
vim.command("redraw")
END
endfunction
let s:ref = function('s:christmas')

function! s:christmas_bg(...) abort
py3 << END
norm = random.choice(bgcolors)
[vim.command("hi {} term=bold gui=bold guibg={} guifg=#ffb653".format(i, norm)) for i in bg]
END
endfunction
let s:ref_bg = function('s:christmas_bg')

function! Xmas()
py3 << END
import random
colors = ("#ea4630", "#f8b229", "#00008a", "white")
bgcolors = ("#165b33", "#146b3a")
bg = ("normal", "nontext", "linenr", "linenrabove", "linenrbelow")
attribs = (
	"comment", "underlined", "constant", "identifier",
	"statement", "preproc", "type", "special",
	"error", "todo", "directory", "statusline",
	"search", "errormsg", "warningmsg", "modemsg",
	"moremsg", "incsearch", "title", "statuslinenc",
	"label", "operator", "folded", "foldedcolumn",
	"clf0"
	)
[vim.command("hi %s term=bold gui=bold guifg=%s" % (att, random.choice(colors))) for att in attribs]
END
	call s:ref()
	call s:ref_bg()
	let s:timer_id =  timer_start(750, s:ref, #{repeat: -1})
	let s:timer_id_bg =  timer_start(2000, s:ref_bg, #{repeat: -1})
endfunction

function! XmasEnd()
	call timer_stop(s:timer_id)
	call timer_stop(s:timer_id_bg)
	execute ':colorscheme '.colors_name
	redraw
endfunction
