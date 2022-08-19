# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MapApp.Repo.insert!(%MapApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MapApp.Repo
alias MapApp.Locations.Location

location_names = ~w(東京タワー 東京スカイツリー 国会議事堂 東京駅 渋谷マークシティー サンシャイン水族館)

for location_name <- location_names do
  location_name =
    %Location{
      location_name: location_name,
      lat: 0.1,
      long: 0.2
    }

  Repo.insert(location_name)
end
