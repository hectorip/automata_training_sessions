require 'csv'


class Author

	def initialize(email, firstname, lastname)
		@email = email
		@firstname = firstname
		@lastname = lastname

	end

end


class Book
	def initialize(title, isbn, authors, description)

		@title = title
		@isbn = isbn
		@authors = authors
		@description = description

	end

	def to_s
		return "#{@isbn} #{@title}"
	end
end

class Magazine
	def initialize(title, isbn, authors, publishedAt)
		@title = title
		@isbn = isbn
		@authors = authors
		@publishedAt = publishedAt
	end
end




def get_authors(filepath)
	data = CSV.read(filepath)

	# cols = data[0]
	ind = 0
	cols = []
	authors = []
	for row in data
		if ind == 0
			cols = row
			next
		end

		authors.append(Author.new(row[0], row[1], row[2]))

		ind += 1
		return authors
	end
end

def get_books(filepath)
	data = CSV.read(filepath)

	# cols = data[0]
	ind = 0
	cols = []
	books = []
	
	for row in data
		if ind == 0
			cols = row
			ind += 1
			next

		end

		book = Book.new(row[0], row[1], row[2], row[3])
		puts book
		books.append(book)
		ind += 1

	end
	return books
end

def get_magazines(filepath)
	data = CSV.read(filepath)

	# cols = data[0]
	ind = 0
	cols = []
	magazines = []
	for row in data
		if ind == 0
			cols = row
		end

		magazines.append(Magazine.new(row[0], row[1], row[2], row[3]))

		ind += 1
		return magazines
	end
end


if __FILE__ == $0
	authors_path = "kata-library/data/authors.csv"
	books_path = "kata-library/data/books.csv"
	magazines_path = "kata-library/data/magazines.csv"
	

	authors = get_authors(authors_path)
	books = get_books(books_path)
	magazines = get_magazines(magazines_path)

	# for book in books
	# 	puts book
	# end
end