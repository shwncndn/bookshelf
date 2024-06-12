defmodule Bookshelf.Formats.Cd do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cds" do
    field :title, :string
    field :artist, :string
    field :published, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cd, attrs) do
    cd
    |> cast(attrs, [:title, :artist, :published])
    |> validate_required([:title, :artist, :published])
  end
end
