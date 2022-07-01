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
  attr_writer :description, :published_at
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
    @isbn_idx = {}
    @authors_idx = {}
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
    files.each do |file|
      _load_papers(file, col_sep)
    end
  end
  def _load_papers(files, col_sep = ';')
    csv = load_csv([files], col_sep)
    optional_map = {
      "publishedAt" => "published_at"
    }
    optional_cols = {}
    csv.headers.each_with_index  do |optional_col, index|
      if index > 2
        optional_cols[index] = optional_col
      end
    end
    csv.each do |row|
      paper = Paper.new(row[0], row[1], row[2])
      optional_cols.each do |index, optional_col|
        prop_name = optional_map.fetch(optional_col, optional_col)
        paper.send("#{prop_name}=", row[index])
      end

      @isbn_idx[paper.isbn] = @papers.count
      @papers.append(paper)
      unless @authors_idx.has_key?(paper.authors)
        @authors_idx[paper.authors] = []
      end
      @authors_idx[paper.authors].append(paper.isbn)
    end
  end

  def find_by_isbn(isbn)
    idx = @isbn_idx.fetch(isbn, nil)
    if idx == nil
      return nil
    end
    @papers[idx]
  end

  def find(isbn = nil, authors = nil)
    if isbn
      return find_by_isbn(isbn)
    end
    if authors
      isbns = @authors_idx.fetch(authors, nil)
      papers = []
      isbns.each do |isbn|
        paper = find_by_isbn(isbn)
        if paper
          papers.append(paper)
        end
      end
    end
  end

end
