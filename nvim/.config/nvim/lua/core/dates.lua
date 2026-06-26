-- Quick date insertion via @keyword.
-- Type @today (or any keyword below) then a space/punctuation: the @keyword
-- becomes a date. Plain words without a leading @ are left untouched, and a
-- lone @ stays a @ until a full keyword follows.
--
-- Keywords must be valid identifiers (letters/digits/underscore) so Vim accepts
-- them as abbreviations -- use @next_week, not @next-week.
local M = {}

-- default output format; override via setup({ format = "..." })
local fmt = "%Y-%m-%d"

-- day offset via a date table so DST / month-end roll over correctly
local function days_from_now(n)
  local t = os.date("*t") --[[@as osdate]]
  t.day = t.day + n
  return os.date(fmt, os.time(t))
end

local function next_monday()
  local wday = os.date("*t").wday -- 1=Sun .. 7=Sat
  local diff = (2 - wday + 7) % 7 -- 2 = Monday
  if diff == 0 then
    diff = 7                      -- today is Monday -> jump to *next* Monday
  end
  return days_from_now(diff)
end

-- keyword (typed after @) -> function returning the string to insert
M.keywords = {
  today = function()
    return days_from_now(0)
  end,
  tomorrow = function()
    return days_from_now(1)
  end,
  yesterday = function()
    return days_from_now(-1)
  end,
  next_week = next_monday,
}

-- <expr> abbreviation callback. Vim has already stripped the keyword by the time
-- this runs, so a single <BS> removes the leading @ before the date is inserted.
function M.expand(key)
  local fn = M.keywords[key]
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before = vim.api.nvim_get_current_line():sub(1, col)
  if fn and before:match("@" .. key .. "$") then
    return vim.api.nvim_replace_termcodes("<BS>", true, false, true) .. fn()
  end
  return key -- no leading @ -> leave the typed word as-is
end

function M.setup(opts)
  opts = opts or {}
  if opts.format then
    fmt = opts.format
  end
  for key in pairs(M.keywords) do
    vim.cmd(string.format("iabbrev <expr> %s v:lua.require'core.dates'.expand('%s')", key, key))
  end
end

M.setup()

return M
