defmodule Bookshelf.Formats do
  @moduledoc """
  The Formats context.
  """

  import Ecto.Query, warn: false
  alias Bookshelf.Repo

  alias Bookshelf.Formats.Record

  @doc """
  Returns the list of records.

  ## Examples

      iex> list_records()
      [%Record{}, ...]

  """
  def list_records do
    Repo.all(Record)
  end

  @doc """
  Gets a single record.

  Raises `Ecto.NoResultsError` if the Record does not exist.

  ## Examples

      iex> get_record!(123)
      %Record{}

      iex> get_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record!(id), do: Repo.get!(Record, id)

  @doc """
  Creates a record.

  ## Examples

      iex> create_record(%{field: value})
      {:ok, %Record{}}

      iex> create_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record(attrs \\ %{}) do
    %Record{}
    |> Record.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record.

  ## Examples

      iex> update_record(record, %{field: new_value})
      {:ok, %Record{}}

      iex> update_record(record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record(%Record{} = record, attrs) do
    record
    |> Record.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a record.

  ## Examples

      iex> delete_record(record)
      {:ok, %Record{}}

      iex> delete_record(record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record(%Record{} = record) do
    Repo.delete(record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record changes.

  ## Examples

      iex> change_record(record)
      %Ecto.Changeset{data: %Record{}}

  """
  def change_record(%Record{} = record, attrs \\ %{}) do
    Record.changeset(record, attrs)
  end

  alias Bookshelf.Formats.Cassette

  @doc """
  Returns the list of cassettes.

  ## Examples

      iex> list_cassettes()
      [%Cassette{}, ...]

  """
  def list_cassettes do
    Repo.all(Cassette)
  end

  @doc """
  Gets a single cassette.

  Raises `Ecto.NoResultsError` if the Cassette does not exist.

  ## Examples

      iex> get_cassette!(123)
      %Cassette{}

      iex> get_cassette!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cassette!(id), do: Repo.get!(Cassette, id)

  @doc """
  Creates a cassette.

  ## Examples

      iex> create_cassette(%{field: value})
      {:ok, %Cassette{}}

      iex> create_cassette(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cassette(attrs \\ %{}) do
    %Cassette{}
    |> Cassette.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cassette.

  ## Examples

      iex> update_cassette(cassette, %{field: new_value})
      {:ok, %Cassette{}}

      iex> update_cassette(cassette, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cassette(%Cassette{} = cassette, attrs) do
    cassette
    |> Cassette.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cassette.

  ## Examples

      iex> delete_cassette(cassette)
      {:ok, %Cassette{}}

      iex> delete_cassette(cassette)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cassette(%Cassette{} = cassette) do
    Repo.delete(cassette)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cassette changes.

  ## Examples

      iex> change_cassette(cassette)
      %Ecto.Changeset{data: %Cassette{}}

  """
  def change_cassette(%Cassette{} = cassette, attrs \\ %{}) do
    Cassette.changeset(cassette, attrs)
  end

  alias Bookshelf.Formats.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  alias Bookshelf.Formats.Songbook

  @doc """
  Returns the list of songbooks.

  ## Examples

      iex> list_songbooks()
      [%Songbook{}, ...]

  """
  def list_songbooks do
    Repo.all(Songbook)
  end

  @doc """
  Gets a single songbook.

  Raises `Ecto.NoResultsError` if the Songbook does not exist.

  ## Examples

      iex> get_songbook!(123)
      %Songbook{}

      iex> get_songbook!(456)
      ** (Ecto.NoResultsError)

  """
  def get_songbook!(id), do: Repo.get!(Songbook, id)

  @doc """
  Creates a songbook.

  ## Examples

      iex> create_songbook(%{field: value})
      {:ok, %Songbook{}}

      iex> create_songbook(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_songbook(attrs \\ %{}) do
    %Songbook{}
    |> Songbook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a songbook.

  ## Examples

      iex> update_songbook(songbook, %{field: new_value})
      {:ok, %Songbook{}}

      iex> update_songbook(songbook, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_songbook(%Songbook{} = songbook, attrs) do
    songbook
    |> Songbook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a songbook.

  ## Examples

      iex> delete_songbook(songbook)
      {:ok, %Songbook{}}

      iex> delete_songbook(songbook)
      {:error, %Ecto.Changeset{}}

  """
  def delete_songbook(%Songbook{} = songbook) do
    Repo.delete(songbook)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking songbook changes.

  ## Examples

      iex> change_songbook(songbook)
      %Ecto.Changeset{data: %Songbook{}}

  """
  def change_songbook(%Songbook{} = songbook, attrs \\ %{}) do
    Songbook.changeset(songbook, attrs)
  end

  alias Bookshelf.Formats.Cd

  @doc """
  Returns the list of cds.

  ## Examples

      iex> list_cds()
      [%Cd{}, ...]

  """
  def list_cds do
    Repo.all(Cd)
  end

  @doc """
  Gets a single cd.

  Raises `Ecto.NoResultsError` if the Cd does not exist.

  ## Examples

      iex> get_cd!(123)
      %Cd{}

      iex> get_cd!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cd!(id), do: Repo.get!(Cd, id)

  @doc """
  Creates a cd.

  ## Examples

      iex> create_cd(%{field: value})
      {:ok, %Cd{}}

      iex> create_cd(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cd(attrs \\ %{}) do
    %Cd{}
    |> Cd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cd.

  ## Examples

      iex> update_cd(cd, %{field: new_value})
      {:ok, %Cd{}}

      iex> update_cd(cd, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cd(%Cd{} = cd, attrs) do
    cd
    |> Cd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cd.

  ## Examples

      iex> delete_cd(cd)
      {:ok, %Cd{}}

      iex> delete_cd(cd)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cd(%Cd{} = cd) do
    Repo.delete(cd)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cd changes.

  ## Examples

      iex> change_cd(cd)
      %Ecto.Changeset{data: %Cd{}}

  """
  def change_cd(%Cd{} = cd, attrs \\ %{}) do
    Cd.changeset(cd, attrs)
  end
end
