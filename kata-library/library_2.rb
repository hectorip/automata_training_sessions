require 'csv'

# Classes
class Author


    def initialize(email, firstname, lastname)

        @email = email
        @firstname = firstname
        @lastname = lastname
    end

    def to_s
        "😅 #{@firstname} #{@lastname}"
    end
end


class Book
    attr_accessor :isbn
    attr_accessor :authors

    def initialize(title, isbn, authors, description)
        @title = title
        @isbn = isbn
        @authors = authors
        @description = description
    end

    def to_s
        "📗 #{@isbn} - #{@title} \n#{@description}\n"
    end
end


class Magazine
    attr_accessor :isbn
    attr_accessor :authors

    def initialize(title,isbn,authors,publishedAt)

        @title = title
        @isbn = isbn
        @authors = authors
        @publishedAt = publishedAt

    end

    def to_s
        "📰 #{@isbn} - #{@title} #{@publishedAt}"
    end
end

# Reading csv

def get_authors()
    csv_authors = CSV.read('data/authors.csv')
    authors = []

    csv_authors = csv_authors.drop(1)

    for author in csv_authors do
        authors << Author.new(author[0], author[1], author[2])
    end

    return authors
end

def get_books()
    csv_books = CSV.read('data/books.csv')
    csv_books = csv_books.drop(1)

    books = []
    csv_books.each do |book|
        books << Book.new(book[0], book[1], book[2], book[3])
    end
    return books
end

def get_magazines
    csv_magazines = CSV.read('data/magazines.csv')

    csv_magazines = csv_magazines.drop(1)

    magazines = []

    for maga in csv_magazines
        magazines << Magazine.new(maga[0], maga[1], maga[2], maga[3])
    end

    return magazines
end

def search(isbn)
    books = get_books()

    found = books.find {|book| book.isbn == isbn}

    if found
        return found
    end

    magazines  = get_magazines()

    found = magazines.find {|magazine| magazine.isbn == isbn}

    if found
        return found
    end
    return nil
end

def search_by_email(email)
    books = get_books()

    found = books.filter {|book| book.authors == email}

    if found
        puts(found)
    end

    magazines  = get_magazines()

    found = magazines.filter {|magazine| magazine.authors == email}

    if found
        puts(found)
    end
    return nil
end

def main()

    puts("Select on of the Options:\n a) authors\n b) Books\n m)Magazines\n s)Buscar por ISBN\n c)Buscar por author\n d)All\n")
    selection = gets.chomp

    puts("--")
    puts("#{selection.class}")
    puts("--")

    case selection
    when "a"
        authors = get_authors()
        puts(authors)
    when "b"
        books = get_books()
        puts(books)

    when "m"
        magazines = get_magazines()
        puts(magazines)

    when "c"
        puts("Ingresa el email del author")
        email = gets.chomp

        search_by_email(email)


    when "s"
        puts("Ingresa el isbn")
        isbn = gets.chomp
        found = search(isbn)

        if found.nil?
            puts("No se encontro.!!")
            return
        end

        puts(found)

    else
        puts("error")
    end

end




main()
