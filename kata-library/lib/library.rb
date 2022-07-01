require 'csv'

class Author
  attr_reader :email, :first_name, :last_name
  def initialize (email, first_name, last_name)
    @email = email
    @first_name = first_name
    @last_name = last_name
  end
end

class Paper
  attr_reader :title, :isbn, :authors, :description, :published_at
  #title;isbn;authors;description;publishedAt
  def initialize(title, isbn, authors, description="", published_at="")
    @title = title
    @isbn = isbn
    @authors = authors
    @description = description
    @published_at = published_at
  end
end

class Library
  attr_reader :authors, :papers

  def initialize
    @authors = []
    @papers = []
  end

  def load_csv(files, col_sep = ";")
    files.each do |file|
      path_file = File.join(File.dirname(__FILE__), file)
      csv_text = File.read(path_file)
      return CSV.parse(csv_text, :headers => true, :col_sep => col_sep)
    end
  end

  def load_authors(files, col_sep = ';')
    csv = load_csv(files, col_sep)
    csv.each do |row|
      @authors.append(Author.new(row[0], row[1], row[2]))
    end
  end

  def load_papers(files, col_sep = ';')
    csv = load_csv(files, col_sep)
    csv.each do |row|
      @papers.append(Paper.new(row[0], row[1], row[2], row[3]))
    end
  end
end
