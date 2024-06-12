defmodule Bookshelf.Formats.Songbook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songbooks" do
    field :title, :string
    field :artist, :string
    field :published, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(songbook, attrs) do
    songbook
    |> cast(attrs, [:title, :artist, :published])
    |> validate_required([:title, :artist, :published])
  end
end
