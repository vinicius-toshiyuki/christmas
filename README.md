# Vim Christmas Lights C:

Install with Vim Plug:

In `.vimrc`:

```
call plug#begin('~/.vim/plugged')
...
Plug 'vinicius-toshiyuki/christmas'
...
call plug#end()
```

And call in terminal:

```
vim +PlugInstall +qa
```

To use, in vim, call:

```
:call Xmas()
```

Stop with:

```
:call XmasEnd()
```

# License
MIT
