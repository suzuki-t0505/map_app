defmodule MapAppWeb.MapController do
  use MapAppWeb, :controller
  alias MapApp.Locations.Location
  alias MapApp.Locations

  def index(conn, _params) do
    locations = Locations.get_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = Location.changeset(%Location{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location" => attrs}) do
    case Locations.create(attrs) do
      {:ok, _location} ->
        conn
        |> put_flash(:info, "座標が登録できました。")
        |> redirect(to: Routes.map_path(conn, :index))

      {:error, cs} ->
        render(conn, "new.html", changeset: cs)
    end
  end
end
