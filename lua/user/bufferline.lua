
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    default = true,
    --[[ shifts buffers to the left  ]]
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer" ,
        text_align = "center",
        --[[ separator = true ]]
      }
    },
  },
}
