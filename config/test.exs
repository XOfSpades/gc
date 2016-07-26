use Mix.Config

config :comeonin,
  crypto_mod: :bcrypt,
  bcrypt_log_rounds: 2, # make tests faster
  pbkdf2_rounds: 4

# Configure your database
config :gc, Gc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gc_test",
  pool_size: 10, # Use a single connection for transactional tests
  pool: Ecto.Adapters.SQL.Sandbox

config :gc,
  cowboy_port: 8080
