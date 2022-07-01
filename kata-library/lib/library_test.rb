require_relative 'library'
require 'test/unit'


class TestLibrary < Test::Unit::TestCase


  def test_load_authors
    library = Library.new()
    library.load_authors(["../data/authors.csv"])

    assert_equal(6, library.authors.count)

  end

  # def test_load_books
  #
  # end

end
