return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
    end,
  },
  {
    "wakatime/vim-wakatime", lazy=false
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
--{
    -- "windwp/nvim-ts-autotag",
    -- config = function()
      -- require('nvim-ts-autotag').setup({
        -- filetypes = {"html"}
      -- })
    -- end,
  -- },
}
