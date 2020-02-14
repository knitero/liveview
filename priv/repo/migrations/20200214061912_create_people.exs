defmodule Playaround.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :surname, :string
      add :email, :string

      timestamps()
    end
  end
end
