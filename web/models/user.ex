defmodule Rumbl.User do
  use Rumbl.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_presence(:username)
    |> validate_length(:username, max: 20)
    |> validate_presence(:name)
  end

  defp validate_presence(changeset, field) do
    validate_length(changeset, field, min: 1, message: "can't be blank")
  end
end
