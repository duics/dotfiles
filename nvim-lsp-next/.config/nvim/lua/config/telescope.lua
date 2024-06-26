local present, telescope = pcall(require, "telescope")

if not present then
   return
end

local default = {
    -- pickers = {
    --     find_files = {
    --         hidden = true,
    --         theme = 'dropdown'
    --     },
    --     live_grep = {
    --         theme = 'dropdown'
    --     },
    --     lsp_references = {
    --         theme = 'dropdown'
    --     },
    --     diagnostics = {
    --         theme = 'dropdown'
    --     },
    --     current_buffer_fuzzy_find = {
    --         theme = 'dropdown'
    --     }
    -- },
   defaults = {
      -- vimgrep_arguments = {
      --    "rg",
      --    "--color=never",
      --    "--no-heading",
      --    "--with-filename",
      --    "--line-number",
      --    "--column",
      --    "--smart-case",
      -- },
      prompt_prefix = " ",
      selection_caret = " ",
      -- entry_prefix = "  ",
      -- initial_mode = "insert",
      -- selection_strategy = "reset",
      -- sorting_strategy = "ascending",
      -- layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      -- file_sorter = require("telescope.sorters").get_fuzzy_file,
      -- file_ignore_patterns = { "node_modules" },
      -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "smart" },
      -- winblend = 0,
      -- border = true,
      -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      -- use_less = true,
      -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- -- Developer configurations: Not meant for general override
      -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
}

telescope.setup(default)
telescope.load_extension('fzf')
telescope.load_extension('project')
