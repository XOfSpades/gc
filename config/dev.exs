use Mix.Config

# Configure your database
config :gc, Gc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gc_dev",
  pool_size: 10 # The amount of database connections in the pool
