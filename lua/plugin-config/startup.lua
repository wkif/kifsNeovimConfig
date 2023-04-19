local status, startup = pcall(require, "startup")
if not status then
    vim.notify("没有找到 startup")
  return
end
startup.setup({theme = "dashboard"})

