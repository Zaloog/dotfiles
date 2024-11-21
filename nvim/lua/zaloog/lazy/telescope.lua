return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults ={
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top"
        },
        mappings = {
           i = {  -- Insert mode mappings
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
          },
        }
      }
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
    vim.keymap.set('n', '<leader><Tab>', builtin.buffers, {})
    -- vim.keymap.set('n', '<C-J>', builtin.buffers, {})
    -- vim.keymap.set('n', '<C-K>', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
