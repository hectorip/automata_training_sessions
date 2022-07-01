require_relative 'library'
require 'test/unit'


class TestLibrary < Test::Unit::TestCase


  def test_load_authors
    library = Library.new
    library.load_authors(["../data/authors.csv"])

    assert_equal(6, library.authors.count)

    assert_equal("null-walter@echocat.org", library.authors[0].email)
    assert_equal("Harald", library.authors[-1].first_name)

  end


  def test_load_books
    library = Library.new
    library.load_papers(["../data/books.csv"])

    assert_equal(8, library.papers.count)

    assert_equal("5554-5545-4518", library.papers[0].isbn)
    assert_equal("Schuhbecks Kochschule. Kochen lernen mit Alfons Schuhbeck ", library.papers[-1].title)
  end

end
