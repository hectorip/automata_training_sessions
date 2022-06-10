require_relative 'library'
require "test/unit"

class TestLibrary < Test::Unit::TestCase

=begin
  def setup
    @library = Library.new
  end
=end

  def test_load_books
    library = Library.new(["books.csv"])
    # Load items
    library.load
    # Assert count loaded items
    assert_equal(8, library.papers.count)

    # Assert some info of first book
    first_book = library.papers[0]
    assert_equal("5554-5545-4518", first_book.isbn)
    # Assert some info of last book
    last_book = library.papers[-1]
    assert_equal("1215-4545-5895", last_book.isbn)
  end

  def test_load_magazines
    library = Library.new(["magazines.csv"])
    # Load items
    library.load
    # Assert count loaded items

    assert_equal(6, library.papers.count)

    # Assert some info of first magazine
    first_book = library.papers[0]
    assert_equal("5454-5587-3210", first_book.isbn)
    # Assert some info of last magazine
    last_book = library.papers[-1]
    assert_equal("1313-4545-8875", last_book.isbn)
  end

  def test_load_authors
    library = Library.new(["authors.csv"])
    # Load items
    library.load
    # Assert count loaded items

    assert_equal(6, library.papers.count)

    # Assert some info of first author
    first_author = library.papers[0]
    assert_equal("null-walter@echocat.org", first_author.email)
    # Assert some info of last author
    last_author = library.papers[-1]
    assert_equal("null-rabe@echocat.org", last_author.email)
  end
end
