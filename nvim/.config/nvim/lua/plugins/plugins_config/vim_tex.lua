-- https://github.com/lervag/vimtex
-- " This is necessary for VimTeX to load properly. The "indent" is optional.
-- " Note that most plugin managers will do this automatically.
-- filetype plugin indent on
vim.g.filetype_plugin_indent = true
--
-- " This enables Vim's and neovim's syntax-related features. Without this, some
-- " VimTeX features will not work (see ":help vimtex-requirements" for more
-- " info).
-- syntax enable
-- vim.g.syntax = true
--
-- " Viewer options: One may configure the viewer either by specifying a built-in
-- " viewer method:
-- let g:vimtex_view_method = 'zathura'
-- vim.g.vimtex_view_method = 'zathura'
--
-- " Or with a generic interface:
-- let g:vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_viewer = 'okular'
-- let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
-- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
--
-- " VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- " strongly recommended, you probably don't need to configure anything. If you
-- " want another compiler backend, you can change it as follows. The list of
-- " supported backends and further explanation is provided in the documentation,
-- " see ":help vimtex-compiler".
-- let g:vimtex_compiler_method = 'latexrun'
-- vim.g.vimtex_compiler_method = 'latexmk'
-- use engines "xelatex"
vim.api.nvim_exec([[
    let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
    let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}
]], true)
-- vim.g.Tex_CompileRule_xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
--
-- " Most VimTeX mappings rely on localleader and this can be changed with the
-- " following line. The default is usually fine and is the symbol "\".
-- let maplocalleader = ","
vim.maplocalleader = ","
vim.keymap.set({'n'}, 'U', '<Plug>(vimtex-doc-package)')
