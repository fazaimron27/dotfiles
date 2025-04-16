return {
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      colors = {
        line_number = "#7f848e",
      },
      highlights = {
        Comment = { italic = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
      },
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "NONE",
      },
      options = {
        cursorline = true,
        transparency = true,
        terminal_colors = true,
        highlight_inactive_windows = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
