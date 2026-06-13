 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#10131c',
    base01 = '#1c1f29',
    base02 = '#262a34',
    base03 = '#8a90a5',
    base04 = '#bfc6dc',
    base05 = '#e0e2ef',
    base06 = '#e0e2ef',
    base07 = '#e0e2ef',
    base08 = '#ffb4ab',
    base09 = '#afc6ff',
    base0A = '#85d2e8',
    base0B = '#56d6f5',
    base0C = '#afc6ff',
    base0D = '#56d6f5',
    base0E = '#85d2e8',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e2ef',          bg = '#10131c' })
  hi('TelescopeBorder',         { fg = '#8a90a5',             bg = '#10131c' })
  hi('TelescopePromptNormal',   { fg = '#e0e2ef',          bg = '#10131c' })
  hi('TelescopePromptBorder',   { fg = '#8a90a5',             bg = '#10131c' })
  hi('TelescopePromptPrefix',   { fg = '#56d6f5',             bg = '#10131c' })
  hi('TelescopePromptCounter',  { fg = '#bfc6dc',  bg = '#10131c' })
  hi('TelescopePromptTitle',    { fg = '#10131c',             bg = '#56d6f5' })
  hi('TelescopePreviewTitle',   { fg = '#10131c',             bg = '#85d2e8' })
  hi('TelescopeResultsTitle',   { fg = '#10131c',             bg = '#afc6ff' })
  hi('TelescopeSelection',      { fg = '#e0e2ef',          bg = '#262a34' })
  hi('TelescopeSelectionCaret', { fg = '#56d6f5',             bg = '#262a34' })
  hi('TelescopeMatching',       { fg = '#56d6f5',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
