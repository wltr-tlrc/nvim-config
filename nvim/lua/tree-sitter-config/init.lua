
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "markdown", "cpp", "julia", "fortran", "typescript" },
  sync_install = false,
  indent = {
    enable = true,
    disable = { "python" },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
}
