defmodule MapApp.Locations do
  alias MapApp.Repo
  alias MapApp.Locations.Location

  def get_locations() do
    Repo.all(Location)
  end

  def create(attrs) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end
end
