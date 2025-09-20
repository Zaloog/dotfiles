local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end
return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults ={
        sorting_strategy = "ascending",
        file_ignore_patterns ={
                    "__pycache__",
                    ".venv",
                },
        layout_config = {
          prompt_position = "top"
        },
        mappings = {
           i = {  -- Insert mode mappings
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
            ["<CR>"] = select_one_or_multi,
          },
        }
      }
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
    vim.keymap.set('n', '<leader><Tab>', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
    vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
    -- vim.keymap.set('n', '<C-J>', builtin.buffers, {})
    -- vim.keymap.set('n', '<C-K>', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
