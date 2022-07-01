require_relative "library"
require "test/unit"

class LibraryTest < Test::Unit::TestCase

    def test_load_autors
        # I don't really know if we need to test this

        library = Library.new
        # this relative path is hurting me
        library.load_authors("data/authors.csv")
        assert_equal(6, library.authors.size)
    end
    def test_load_books
        library = Library.new
        library.load_books("data/books.csv")
        assert_equal(8, library.books.size)
    end
    def test_load_magazines
        library = Library.new
        library.load_magazines("data/magazines.csv")
        assert_equal(6, library.magazines.size)
    end
    def test_author_represetation
        author = Author.new("John", "Doe", "jd@gmail.com")
        assert_equal("Author: John Doe, jd@gmail.com", author.to_s)
    end
    def test_book_representation
        antoine = Author.new("Antoine", "Saint-Exupery", "as-e@gmail.com")
        book = Book.new("El principito", [antoine], "12345", "El mejor libro para niños")
        assert_equal("Book: El principito, Author(s): Antoine Saint-Exupery, ISBN: 12345, Desc: El mejor libro para niños", book.to_s)
    end
    def test_magazine_representation
        shane = Author.new("Shane", "Parrish", "fs@gmail.com")
        magazine = Magazine.new("Farnam Street", shane, "12345", "Modelos mentales y más")
        assert_equal("Magazine: Farnam Street, Author(s): Shane Parrish, ISBN: 12345, Desc: Modelos mentales y más", magazine.to_s)
end
