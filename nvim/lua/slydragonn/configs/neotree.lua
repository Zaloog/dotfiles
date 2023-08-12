local status, neotree = pcall(require, "neo-tree")

if not status then
	return
end

neotree.setup({
  window = {
     mappings = {
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["C"] = "close_node",
        ["h"] = "close_all_nodes",
        ["l"] = "expand_all_nodes",
     }
    }
})
