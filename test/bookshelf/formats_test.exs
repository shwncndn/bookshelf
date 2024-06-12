defmodule Bookshelf.FormatsTest do
  use Bookshelf.DataCase

  alias Bookshelf.Formats

  describe "records" do
    alias Bookshelf.Formats.Record

    import Bookshelf.FormatsFixtures

    @invalid_attrs %{title: nil, artist: nil, released: nil}

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Formats.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Formats.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      valid_attrs = %{title: "some title", artist: "some artist", released: 42}

      assert {:ok, %Record{} = record} = Formats.create_record(valid_attrs)
      assert record.title == "some title"
      assert record.artist == "some artist"
      assert record.released == 42
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Formats.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      update_attrs = %{title: "some updated title", artist: "some updated artist", released: 43}

      assert {:ok, %Record{} = record} = Formats.update_record(record, update_attrs)
      assert record.title == "some updated title"
      assert record.artist == "some updated artist"
      assert record.released == 43
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Formats.update_record(record, @invalid_attrs)
      assert record == Formats.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Formats.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Formats.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Formats.change_record(record)
    end
  end

  describe "cassettes" do
    alias Bookshelf.Formats.Cassette

    import Bookshelf.FormatsFixtures

    @invalid_attrs %{title: nil, artist: nil, released: nil}

    test "list_cassettes/0 returns all cassettes" do
      cassette = cassette_fixture()
      assert Formats.list_cassettes() == [cassette]
    end

    test "get_cassette!/1 returns the cassette with given id" do
      cassette = cassette_fixture()
      assert Formats.get_cassette!(cassette.id) == cassette
    end

    test "create_cassette/1 with valid data creates a cassette" do
      valid_attrs = %{title: "some title", artist: "some artist", released: 42}

      assert {:ok, %Cassette{} = cassette} = Formats.create_cassette(valid_attrs)
      assert cassette.title == "some title"
      assert cassette.artist == "some artist"
      assert cassette.released == 42
    end

    test "create_cassette/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Formats.create_cassette(@invalid_attrs)
    end

    test "update_cassette/2 with valid data updates the cassette" do
      cassette = cassette_fixture()
      update_attrs = %{title: "some updated title", artist: "some updated artist", released: 43}

      assert {:ok, %Cassette{} = cassette} = Formats.update_cassette(cassette, update_attrs)
      assert cassette.title == "some updated title"
      assert cassette.artist == "some updated artist"
      assert cassette.released == 43
    end

    test "update_cassette/2 with invalid data returns error changeset" do
      cassette = cassette_fixture()
      assert {:error, %Ecto.Changeset{}} = Formats.update_cassette(cassette, @invalid_attrs)
      assert cassette == Formats.get_cassette!(cassette.id)
    end

    test "delete_cassette/1 deletes the cassette" do
      cassette = cassette_fixture()
      assert {:ok, %Cassette{}} = Formats.delete_cassette(cassette)
      assert_raise Ecto.NoResultsError, fn -> Formats.get_cassette!(cassette.id) end
    end

    test "change_cassette/1 returns a cassette changeset" do
      cassette = cassette_fixture()
      assert %Ecto.Changeset{} = Formats.change_cassette(cassette)
    end
  end

  describe "books" do
    alias Bookshelf.Formats.Book

    import Bookshelf.FormatsFixtures

    @invalid_attrs %{title: nil, author: nil, published: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Formats.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Formats.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{title: "some title", author: "some author", published: 42}

      assert {:ok, %Book{} = book} = Formats.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.author == "some author"
      assert book.published == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Formats.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{title: "some updated title", author: "some updated author", published: 43}

      assert {:ok, %Book{} = book} = Formats.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.author == "some updated author"
      assert book.published == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Formats.update_book(book, @invalid_attrs)
      assert book == Formats.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Formats.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Formats.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Formats.change_book(book)
    end
  end

  describe "songbooks" do
    alias Bookshelf.Formats.Songbook

    import Bookshelf.FormatsFixtures

    @invalid_attrs %{title: nil, artist: nil, published: nil}

    test "list_songbooks/0 returns all songbooks" do
      songbook = songbook_fixture()
      assert Formats.list_songbooks() == [songbook]
    end

    test "get_songbook!/1 returns the songbook with given id" do
      songbook = songbook_fixture()
      assert Formats.get_songbook!(songbook.id) == songbook
    end

    test "create_songbook/1 with valid data creates a songbook" do
      valid_attrs = %{title: "some title", artist: "some artist", published: 42}

      assert {:ok, %Songbook{} = songbook} = Formats.create_songbook(valid_attrs)
      assert songbook.title == "some title"
      assert songbook.artist == "some artist"
      assert songbook.published == 42
    end

    test "create_songbook/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Formats.create_songbook(@invalid_attrs)
    end

    test "update_songbook/2 with valid data updates the songbook" do
      songbook = songbook_fixture()
      update_attrs = %{title: "some updated title", artist: "some updated artist", published: 43}

      assert {:ok, %Songbook{} = songbook} = Formats.update_songbook(songbook, update_attrs)
      assert songbook.title == "some updated title"
      assert songbook.artist == "some updated artist"
      assert songbook.published == 43
    end

    test "update_songbook/2 with invalid data returns error changeset" do
      songbook = songbook_fixture()
      assert {:error, %Ecto.Changeset{}} = Formats.update_songbook(songbook, @invalid_attrs)
      assert songbook == Formats.get_songbook!(songbook.id)
    end

    test "delete_songbook/1 deletes the songbook" do
      songbook = songbook_fixture()
      assert {:ok, %Songbook{}} = Formats.delete_songbook(songbook)
      assert_raise Ecto.NoResultsError, fn -> Formats.get_songbook!(songbook.id) end
    end

    test "change_songbook/1 returns a songbook changeset" do
      songbook = songbook_fixture()
      assert %Ecto.Changeset{} = Formats.change_songbook(songbook)
    end
  end

  describe "cds" do
    alias Bookshelf.Formats.Cd

    import Bookshelf.FormatsFixtures

    @invalid_attrs %{title: nil, artist: nil, published: nil}

    test "list_cds/0 returns all cds" do
      cd = cd_fixture()
      assert Formats.list_cds() == [cd]
    end

    test "get_cd!/1 returns the cd with given id" do
      cd = cd_fixture()
      assert Formats.get_cd!(cd.id) == cd
    end

    test "create_cd/1 with valid data creates a cd" do
      valid_attrs = %{title: "some title", artist: "some artist", published: 42}

      assert {:ok, %Cd{} = cd} = Formats.create_cd(valid_attrs)
      assert cd.title == "some title"
      assert cd.artist == "some artist"
      assert cd.published == 42
    end

    test "create_cd/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Formats.create_cd(@invalid_attrs)
    end

    test "update_cd/2 with valid data updates the cd" do
      cd = cd_fixture()
      update_attrs = %{title: "some updated title", artist: "some updated artist", published: 43}

      assert {:ok, %Cd{} = cd} = Formats.update_cd(cd, update_attrs)
      assert cd.title == "some updated title"
      assert cd.artist == "some updated artist"
      assert cd.published == 43
    end

    test "update_cd/2 with invalid data returns error changeset" do
      cd = cd_fixture()
      assert {:error, %Ecto.Changeset{}} = Formats.update_cd(cd, @invalid_attrs)
      assert cd == Formats.get_cd!(cd.id)
    end

    test "delete_cd/1 deletes the cd" do
      cd = cd_fixture()
      assert {:ok, %Cd{}} = Formats.delete_cd(cd)
      assert_raise Ecto.NoResultsError, fn -> Formats.get_cd!(cd.id) end
    end

    test "change_cd/1 returns a cd changeset" do
      cd = cd_fixture()
      assert %Ecto.Changeset{} = Formats.change_cd(cd)
    end
  end
end
