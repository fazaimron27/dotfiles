return {
  "vyfor/cord.nvim",
  opts = {
    enabled = true,
    log_level = vim.log.levels.OFF,
    editor = {
      client = "lazyvim",
      tooltip = "Powered by caffeine and bad decisions",
      icon = nil,
    },
    display = {
      theme = "void",
      flavor = "dark",
      swap_fields = false,
      swap_icons = true,
    },
    timestamp = {
      enabled = true,
      reset_on_idle = false,
      reset_on_change = false,
    },
    idle = {
      enabled = true,
      timeout = 300000,
      show_status = true,
      ignore_focus = true,
      unidle_on_focus = true,
      smart_idle = true,
      details = "Idling",
      state = nil,
      tooltip = "💤",
      icon = nil,
    },
    text = {
      workspace = function(opts)
        return "Nyasar di " .. opts.workspace
      end,

      viewing = function(opts)
        return "Mengintip " .. opts.filename
      end,

      editing = function(opts)
        return "Bergulat dengan " .. opts.filename
      end,

      file_browser = function(opts)
        return "Mengobrak-abrik " .. opts.name
      end,

      plugin_manager = function(opts)
        return "Menambah masalah dari " .. opts.name
      end,

      lsp = function(opts)
        return "Berdebat dengan LSP di " .. opts.name
      end,

      docs = function(opts)
        return "Berpura-pura paham " .. opts.name
      end,

      vcs = function(opts)
        return "Mengirim doa ke git lewat " .. opts.name
      end,

      notes = function(opts)
        return "Menimbun ide di " .. opts.name
      end,

      debug = function(opts)
        return "Berburu bug di " .. opts.name
      end,

      test = function(opts)
        return "Menguji kesabaran lewat " .. opts.name
      end,

      diagnostics = function(opts)
        return "Mencari sumber masalah di " .. opts.name
      end,

      games = function(opts)
        return "Kabur dari realita lewat " .. opts.name
      end,

      terminal = function(opts)
        return "Berkomunikasi dengan mesin di " .. opts.name
      end,

      dashboard = "Merenungi pilihan hidup",
    },
    -- buttons = nil,
    buttons = {
      {
        label = "Lihat TKP",
        url = function(opts)
          return opts.repo_url
        end,
      },
    },
    assets = nil,
    variables = nil,
    hooks = {
      ready = nil,
      shutdown = nil,
      pre_activity = nil,
      post_activity = nil,
      idle_enter = nil,
      idle_leave = nil,
      workspace_change = nil,
    },
    plugins = nil,
    advanced = {
      plugin = {
        autocmds = true,
        cursor_update = "on_hold",
        match_in_mappings = true,
      },
      server = {
        update = "fetch",
        pipe_path = nil,
        executable_path = nil,
        timeout = 300000,
      },
      discord = {
        reconnect = {
          enabled = false,
          interval = 5000,
          initial = true,
        },
      },
    },
  },
}
