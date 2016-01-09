defmodule Rumbl.Repo do
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "David", username: "drueck", password: "billygrippa"},
      %Rumbl.User{id: "2", name: "Marcus", username: "marquis", password: "billygrippa"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
