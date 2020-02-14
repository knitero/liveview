defmodule PlayaroundWeb.PersonLive do
  use Phoenix.LiveView
  alias PlayaroundWeb.PersonView
  alias Playaround.Entities.Person
  alias Playaround.Entities

  def render(assigns) do
    Phoenix.View.render(PlayaroundWeb.PersonView, "index.html", assigns)
  end

  def mount(params, session, socket) do

    IO.puts "PARAMS ------------------------------"
    IO.inspect params
    IO.puts "   "
    IO.puts "Session ------------------------"
    IO.inspect session
    IO.puts " "
    IO.puts "SOCKET"
    IO.inspect socket


    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket |> fetch()}
  end

  defp fetch(socket) do
    assign(socket,
      people: Entities.list_people(),
      changeset: Entities.change_person(%Person{})
    )
  end

  def handle_event("create", %{"person" => person_params}, socket) do
    case Entities.create_person(person_params) do
      {:ok, person} ->
        {:stop,
         socket
         |> put_flash(:info, "Person created successfully")}

      #  |> push_redirect(to: Routes.live_path(socket, PlayaroundWeb.PersonLive))}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
