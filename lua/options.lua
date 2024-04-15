require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
local M = {}
M.treesiter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "php",
    "markdown",
    "markdown_inline"
  },
  indent = {
    enable = true
  }
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylelua",
    "prettier",
    "php"
  }
}

return M
