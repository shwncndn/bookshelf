defmodule Bookshelf.FormatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookshelf.Formats` context.
  """

  @doc """
  Generate a record.
  """
  def record_fixture(attrs \\ %{}) do
    {:ok, record} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        released: 42,
        title: "some title"
      })
      |> Bookshelf.Formats.create_record()

    record
  end

  @doc """
  Generate a cassette.
  """
  def cassette_fixture(attrs \\ %{}) do
    {:ok, cassette} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        released: 42,
        title: "some title"
      })
      |> Bookshelf.Formats.create_cassette()

    cassette
  end

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        published: 42,
        title: "some title"
      })
      |> Bookshelf.Formats.create_book()

    book
  end

  @doc """
  Generate a songbook.
  """
  def songbook_fixture(attrs \\ %{}) do
    {:ok, songbook} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        published: 42,
        title: "some title"
      })
      |> Bookshelf.Formats.create_songbook()

    songbook
  end

  @doc """
  Generate a cd.
  """
  def cd_fixture(attrs \\ %{}) do
    {:ok, cd} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        published: 42,
        title: "some title"
      })
      |> Bookshelf.Formats.create_cd()

    cd
  end
end
