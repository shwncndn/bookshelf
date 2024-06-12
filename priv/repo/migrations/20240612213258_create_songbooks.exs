defmodule Bookshelf.Repo.Migrations.CreateSongbooks do
  use Ecto.Migration

  def change do
    create table(:songbooks) do
      add :title, :string
      add :artist, :string
      add :published, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
