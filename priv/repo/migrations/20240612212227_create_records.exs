defmodule Bookshelf.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :title, :string
      add :artist, :string
      add :released, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
