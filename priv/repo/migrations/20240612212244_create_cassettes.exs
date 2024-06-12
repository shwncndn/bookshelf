defmodule Bookshelf.Repo.Migrations.CreateCassettes do
  use Ecto.Migration

  def change do
    create table(:cassettes) do
      add :title, :string
      add :artist, :string
      add :released, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
