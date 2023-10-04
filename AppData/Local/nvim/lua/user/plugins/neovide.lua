local function setUp()
  if vim.g.neovide then
    vim.g.neovide_cursor_vfx_mode = "wireframe"
    vim.api.nvim_set_var("neovide_refresh_rate", 75)
    vim.o.guifont = "Hack NFM:h11"
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_bottom = 5
    vim.g.neovide_padding_right = 5
    vim.g.neovide_padding_left = 5
    vim.g.neovide_remember_window_size = true
  end
end

return {
  setUp(),
}
