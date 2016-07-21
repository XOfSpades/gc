use Mix.Config

# Configure your database
config :gc, Gc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gc_test",
  pool_size: 1, # Use a single connection for transactional tests
  pool: Ecto.Adapters.SQL.Sandbox

config :gc,
  cowboy_port: 8080
