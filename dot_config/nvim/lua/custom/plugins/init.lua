-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'datsfilipe/vesper.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'vesper'
    end,
  },
}
