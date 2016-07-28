alias Gc.Repo

Mix.shell.info "Seeding Application..."

{:ok, user} = Model.changeset(
  %Gc.User{}, %{email: "kira@katze.com",password: "qwertz12345"})
|> Repo.insert

Mix.shell.info "Created user:"
Mix.shell.info Model.to_json(user)
