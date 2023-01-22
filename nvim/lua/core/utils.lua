-------------------
-- Utilities ------
-------------------

local M = {}

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function M.nmap(shortcut, command)
  map('n', shortcut, command)
end

function M.imap(shortcut, command)
  map('i', shortcut, command)
end

function M.vmap(shortcut, command)
  map('v', shortcut, command)
end

function M.basename(path)
    local basenameLength = (string.find(string.reverse(path),'/',0,true) - 2)
    if basenameLength > 0 then
        local basenameStart = string.len(path) - basenameLength
        return string.sub(path, basenameStart)
    else
        return path
    end
end

return M
