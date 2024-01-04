local function set_color_scheme()
  local current_hour = tonumber(os.date("%H"))

  if current_hour >= 6 and current_hour < 18 then
    vim.cmd([[colorscheme tokyonight-day]])
    vim.cmd([[echomsg "Day mode activated"]])
  else
    vim.cmd([[colorscheme tokyonight-night]])
    vim.cmd([[echomsg "Night mode activated"]])
  end
end

local function set_color_scheme_on_startup()
  vim.defer_fn(function()
    set_color_scheme()
  end, 100) -- Delay in milliseconds, adjust as needed
end

local timer = vim.loop.new_timer()
timer:start(
  0,
  60000,
  vim.schedule_wrap(function()
    set_color_scheme()
  end)
)

set_color_scheme_on_startup()

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-day",
      setup = function()
        set_color_scheme()
      end,
    },
  },
}
