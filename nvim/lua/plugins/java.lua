return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = "/home/david/.workspace/" .. project_name
		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob("/home/david/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				"/home/david/.local/share/nvim/mason/packages/jdtls/config_linux",
				"-data",
				workspace_dir,
			},
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
			settings = {
				java = {},
			},
			init_options = {
				bundles = {},
			},
		}
    vim.keymap.set("n", "<Leader>cec", require("jdtls").extract_constant, {})
    vim.keymap.set("n", "<Leader>cev", require("jdtls").extract_variable, {})
    vim.keymap.set("n", "<Leader>coi", require("jdtls").organize_imports, {})
		require("jdtls").start_or_attach(config)
	end,
}
