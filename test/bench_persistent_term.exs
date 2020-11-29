:persistent_term.put("USER", "dairon")

Benchee.run(
  %{
    # ENV var
    "System.get_env" => fn -> System.get_env("USER") end,
    # Persistent term
    ":persistent_term.get" => fn -> :persistent_term.get("USER") end,
    # Config
    "Application.fetch_env!" => fn -> Application.fetch_env!(:bench_persistent_term, :user) end
  },
  formatters: [Benchee.Formatters.HTML, Benchee.Formatters.Console]
)
