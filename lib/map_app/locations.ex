defmodule MapApp.Locations do
  import Ecto.Query
  alias MapApp.Repo
  alias MapApp.Locations.Location

  def get_locations() do
    Repo.all(Location)
  end

  def search_location(text) do
    query =
      from(l in Location,
        where: like(l.location_name, ^"%#{text}%")
      )

    Repo.all(query)
  end

  def get_location(id) do
    Repo.get(Location, id)
  end

  def create(attrs) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  def update_location(location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  def delete_location(location) do
    Repo.delete(location)
  end
end
