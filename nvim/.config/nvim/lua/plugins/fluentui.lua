-- FluenTUI: launch the DeepL terminal translator in a zellij floating pane.
--
-- The `fluentui` fish function lives inside `status is-interactive`, so it is invisible to
-- the non-interactive shell Neovim spawns jobs with. Call `mix fluentui` directly instead,
-- letting --cwd stand in for the function's pushd/popd.
--
-- FluenTUI is a full-screen TUI that needs a real TTY, and it binds Esc, Tab and Ctrl+T
-- while capturing the mouse. A zellij pane keeps all of that clear of Neovim's own keymaps.

local PROJECT_DIR = vim.env.FLUENTUI_DIR or vim.fn.expand("~/Documents/sites/dojo/FluenTUI")

local function fail(msg)
  vim.notify("FluenTUI: " .. msg, vim.log.levels.ERROR)
end

local function open()
  if not vim.env.ZELLIJ then
    return fail("not running inside a zellij session")
  end
  if vim.fn.executable("zellij") == 0 then
    return fail("`zellij` not found on PATH")
  end
  if vim.fn.executable("mix") == 0 then
    return fail("`mix` not found on PATH")
  end
  if vim.fn.isdirectory(PROJECT_DIR) == 0 then
    return fail("directory not found: " .. PROJECT_DIR)
  end

  local cmd = {
    "zellij",
    "action",
    "new-pane",
    "--floating",
    "--close-on-exit",
    "--name",
    "FluenTUI",
    "--width",
    "80%",
    "--height",
    "80%",
    "--cwd",
    PROJECT_DIR,
    "--",
    "mix",
    "fluentui",
  }

  -- `zellij action` only messages the running session, so this returns at once and the
  -- callback reports a failure to reach zellij -- not anything FluenTUI itself does.
  vim.system(cmd, { text = true }, function(result)
    if result.code == 0 then
      return
    end
    local msg = "zellij exited with code " .. result.code
    local detail = vim.trim(result.stderr or "")
    if detail ~= "" then
      msg = msg .. "\n" .. detail
    end
    vim.schedule(function()
      fail(msg)
    end)
  end)
end

vim.api.nvim_create_user_command("FluenTUI", open, {
  desc = "Launch FluenTUI in a zellij floating pane",
})

return {}
