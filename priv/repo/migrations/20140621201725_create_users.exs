defmodule Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    [
      "CREATE TABLE users (
        id serial PRIMARY KEY,
        username text,
        email text UNIQUE,
        password text,
        created_at timestamp,
        updated_at timestamp)",
      "CREATE UNIQUE INDEX ON users (lower(username))",
      "CREATE UNIQUE INDEX ON users (lower(email))"
    ]
  end

  def down do
    "DROP TABLE IF EXISTS users"
  end
end
