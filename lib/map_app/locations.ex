defmodule MapApp.Locations do
  alias MapApp.Repo
  alias MapApp.Locations.Location

  def create(attrs) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end
end