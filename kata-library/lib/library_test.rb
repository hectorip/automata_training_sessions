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

    first_desc_part = "Auf der Suche nach einem Basiskochbuch steht man heutzutage vor einer Fülle von Alternativen."
    assert_true(library.papers[0].description.start_with?(first_desc_part))
  end

  def test_load_magazines
    library = Library.new
    library.load_papers(["../data/magazines.csv"])

    assert_equal(6, library.papers.count)

    assert_equal("5454-5587-3210", library.papers[0].isbn)
    assert_equal("23.02.2012", library.papers[-1].published_at)
  end

  def test_load_books_and_magazines
    library = Library.new
    library.load_papers(%w[../data/books.csv ../data/magazines.csv])

    assert_equal(14, library.papers.count)
  end

  def test_find_by_isbn
    library = Library.new
    library.load_papers(%w[../data/books.csv ../data/magazines.csv])

    book = library.find(isbn="2221-5548-8585")
    assert_equal("Das Perfekte Dinner. Die besten Rezepte", book.title)
    book_desc = "Sie wollen auch ein perfektes Dinner kreieren? Mit diesem Buch gelingt es Ihnen!"
    assert_equal(book_desc, book.description)

    magazine = library.find(isbn="2365-8745-7854")
    assert_equal("Gourmet", magazine.title)
    assert_equal("14.06.2010", magazine.published_at)
  end

  def test_find_by_authors
    library = Library.new
    library.load_papers(%w[../data/books.csv ../data/magazines.csv])

    papers = library.find(nil, authors="null-mueller@echocat.org")
    assert_not_nil(papers)
    assert_equal(2, papers.count)
  end

end
