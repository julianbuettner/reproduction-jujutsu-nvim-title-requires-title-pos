# jujutsu.nvim: `'title' requires 'title_pos'`

Tested with Neovim 0.12.6, jj 0.46.0, jujutsu.nvim `0fb33ea`.

`--clean` ignores your own config and plugins. `repro.lua` clones jujutsu.nvim
and creates an empty jj repo, both in `./.repro`.

## Steps

1. `nvim --clean -u repro.lua`
2. `:lua require("jujutsu").open()`
3. Press `O` (new change)

## Result

```
...jujutsu.nvim/lua/jujutsu/spinner.lua:67: Required: 'title' requires 'title_pos'
stack traceback:
	[C]: in function 'open_float'
	...jujutsu.nvim/lua/jujutsu/spinner.lua:67: in function 'show_loading_block'
	...jujutsu.nvim/lua/jujutsu/spinner.lua:131: in function 'start_block'
	...jujutsu.nvim/lua/jujutsu/spinner.lua:168: in function 'start'
	...jujutsu.nvim/lua/jujutsu/process.lua:161: in function 'run'
```
