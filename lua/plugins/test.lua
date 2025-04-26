return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    -- "Issafalcon/neotest-dotnet",
  },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}

    -- Add neotest-python
    table.insert(
      opts.adapters,
      require("neotest-python")({
        dap = { justMyCode = false },
        args = { "--log-level", "DEBUG" },
        runner = "pytest",
        python = ".venv/bin/python", -- Adjust if needed
        pytest_discover_instances = true,
      })
    )

    -- Add neotest-dotnet
    -- table.insert(
    --   opts.adapters,
    --   require("neotest-dotnet")({
    --     strategy = "integrated",
    --     dap = {
    --       -- Optional settings for DAP
    --       justMyCode = false,
    --     },
    --   })
    -- )
  end,
}
