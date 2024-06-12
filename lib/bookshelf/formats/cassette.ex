defmodule Bookshelf.Formats.Cassette do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cassettes" do
    field :title, :string
    field :artist, :string
    field :released, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cassette, attrs) do
    cassette
    |> cast(attrs, [:title, :artist, :released])
    |> validate_required([:title, :artist, :released])
  end
end
