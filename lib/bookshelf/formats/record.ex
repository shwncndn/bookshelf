defmodule Bookshelf.Formats.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :title, :string
    field :artist, :string
    field :released, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:title, :artist, :released])
    |> validate_required([:title, :artist, :released])
  end
end
