defmodule Gc.Authenticate.Password do
@doc """
  Handles the encryption of Passwords and the comparison of them
"""
  def salt_and_hash(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  def is_password(input, password_hash) do
    Comeonin.Bcrypt.checkpw(input, password_hash)
  end
end
