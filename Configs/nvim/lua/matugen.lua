 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141315',
    base01 = '#201f21',
    base02 = '#2b2a2b',
    base03 = '#928f97',
    base04 = '#c9c5cd',
    base05 = '#e5e1e3',
    base06 = '#e5e1e3',
    base07 = '#e5e1e3',
    base08 = '#ffb4ab',
    base09 = '#debecd',
    base0A = '#c9c5cf',
    base0B = '#c9c3dc',
    base0C = '#debecd',
    base0D = '#c9c3dc',
    base0E = '#c9c5cf',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e5e1e3',          bg = '#141315' })
  hi('TelescopeBorder',         { fg = '#928f97',             bg = '#141315' })
  hi('TelescopePromptNormal',   { fg = '#e5e1e3',          bg = '#141315' })
  hi('TelescopePromptBorder',   { fg = '#928f97',             bg = '#141315' })
  hi('TelescopePromptPrefix',   { fg = '#c9c3dc',             bg = '#141315' })
  hi('TelescopePromptCounter',  { fg = '#c9c5cd',  bg = '#141315' })
  hi('TelescopePromptTitle',    { fg = '#141315',             bg = '#c9c3dc' })
  hi('TelescopePreviewTitle',   { fg = '#141315',             bg = '#c9c5cf' })
  hi('TelescopeResultsTitle',   { fg = '#141315',             bg = '#debecd' })
  hi('TelescopeSelection',      { fg = '#e5e1e3',          bg = '#2b2a2b' })
  hi('TelescopeSelectionCaret', { fg = '#c9c3dc',             bg = '#2b2a2b' })
  hi('TelescopeMatching',       { fg = '#c9c3dc',             bold = true })
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
