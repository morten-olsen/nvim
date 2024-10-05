local opt = vim.o
local run = vim.cmd

return {
    "mbbill/undotree",
    event = "BufRead",
    config = function()
      opt.backup = true -- enable backup
      opt.backupdir = os.getenv("HOME") .. "/.vim/backup" -- save backups to this directory
      opt.swapfile = false -- no swap file, no

      -- save undo history
      opt.undodir = os.getenv("HOME") .. "/.vim/undo"
    end,
    keys = {
      { "<leader>U", ":UndotreeToggle<cr>", desc = "Toggle undotree"}
    }
}