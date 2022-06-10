require_relative 'library'
require "test/unit"

class TestLibrary < Test::Unit::TestCase

  def setup
    @library = Library.new
    @library.load
  end

  def test_load_books
    library = Library.new(["data/books.csv"])
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
    assert_equal(6, library.authors.count)

    # Assert some info of first author
    first_author = library.papers[0]
    assert_equal("null-walter@echocat.org", first_author.email)
    # Assert some info of last author
    last_author = library.papers[-1]
    assert_equal("null-rabe@echocat.org", last_author.email)
  end

  def test_load_all_papers
    # Assert count loaded items (books and magazines)
    assert_equal(8 + 6, @library.papers.count)
  end

  def test_find_by_isbn
    paper = @library.find("1024-5245-8584")[0]
    assert_not_nil(paper)
    assert_equal("1024-5245-8584", paper.isbn)
    assert_equal("Genial italienisch", paper.title)
  end

  def test_find_by_author
    papers = @library.find(authors="null-walter@echocat.org")
    # 4
    assert_equal(4, papers.count)
  end

  def test_pretty_print_book
    paper = @library.find("1024-5245-8584")
    long_string = <<EOS
title: O'Reillys Kochbuch für Geeks
isbn: 2215-0012-5487
authors: null-mueller@echocat.org
description: Nach landläufiger Meinung leben Geeks von Cola und TK-Pizza, die sie nachts am Rechner geistesabwesend in sich reinschlingen. Soweit das Klischee! Dass aber Kochen viel mit Programmieren zu tun hat, dass es nämlich ähnlich kreativ ist, dass viele Wege zum individuellen Ziel führen und dass manche Rezepte einfach nur abgefahren und -- ja, geekig sind: Das zeigen zwei Köchinnen in diesem Buch.
EOS

    assert_not_nil(paper)
    assert_equal(long_string, paper.full_print)
  end
end
