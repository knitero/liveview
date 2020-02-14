defmodule PlayaroundWeb.AssignUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, params) do
    IO.puts "PLUG CALLED BEAUTIFULLY"

    assign(conn, :current_user, "Ronzie")

  end

 
end
