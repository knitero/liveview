defmodule Playaround.EntitiesTest do
  use Playaround.DataCase

  alias Playaround.Entities

  describe "people" do
    alias Playaround.Entities.Person

    @valid_attrs %{email: "some email", name: "some name", surname: "some surname"}
    @update_attrs %{
      email: "some updated email",
      name: "some updated name",
      surname: "some updated surname"
    }
    @invalid_attrs %{email: nil, name: nil, surname: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entities.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert Entities.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Entities.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Entities.create_person(@valid_attrs)
      assert person.email == "some email"
      assert person.name == "some name"
      assert person.surname == "some surname"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entities.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Entities.update_person(person, @update_attrs)
      assert person.email == "some updated email"
      assert person.name == "some updated name"
      assert person.surname == "some updated surname"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Entities.update_person(person, @invalid_attrs)
      assert person == Entities.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Entities.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Entities.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Entities.change_person(person)
    end
  end
end
