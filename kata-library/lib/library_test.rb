require_relative 'library'
require 'test/unit'


class TestLibrary < Test::Unit::TestCase


  def test_load_authors
    library = Library.new()
    library.load_authors(["../data/authors.csv"])

    assert_equal(6, library.authors.count)

    assert_equal("null-walter@echocat.org", library.authors[0].email)

    assert_equal("Harald", library.authors[-1].first_name)

  end

  # def test_load_books
  #
  # end

end
