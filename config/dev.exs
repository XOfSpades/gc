use Mix.Config

config :comeonin,
  crypto_mod: :bcrypt,
  bcrypt_log_rounds: 15,
  pbkdf2_rounds: 123_000

# Configure your database
config :gc, Gc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gc_dev",
  pool_size: 10 # The amount of database connections in the pool

config :gc,
  cowboy_port: 8080
