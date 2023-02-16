defmodule DbTest.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users_table) do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:user_name, :string)
    end
  end
end
