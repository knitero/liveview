defmodule Playaround.Entities.Person do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "people" do
    field :email, :string
    field :name, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :surname, :email])
    |> validate_required([:name, :surname, :email])
  end
end
