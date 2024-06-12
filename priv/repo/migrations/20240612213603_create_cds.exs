defmodule Bookshelf.Repo.Migrations.CreateCds do
  use Ecto.Migration

  def change do
    create table(:cds) do
      add :title, :string
      add :artist, :string
      add :published, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
