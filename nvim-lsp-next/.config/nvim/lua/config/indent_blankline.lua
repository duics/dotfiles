require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  buftype_exclude = { 'terminal', 'packer', 'nofile' },
  filetype_exclude = { 'packer' }
}
