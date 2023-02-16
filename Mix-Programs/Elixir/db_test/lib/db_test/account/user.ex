defmodule DbTest.Account.User do
  use Ecto.Schema
  alias DbTest.Account.User
  import Ecto.Changeset

  schema "users_table" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:user_name, :string)
  end

  def changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, [:first_name, :last_name, :user_name])
    |> validate_required([:first_name, :last_name, :user_name])
  end
end
