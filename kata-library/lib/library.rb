require 'csv'

class Author
  attr_reader :email, :first_name, :last_name
  def initialize (email, first_name, last_name)
    @email = email
    @first_name = first_name
    @last_name = last_name
  end
end

class Library
  attr_reader :authors

  def initialize
    @authors = []
  end

  def load_authors(files, col_sep = ';')
    puts 'hola'
    files.each do |file|
      path_file = File.join(File.dirname(__FILE__), file)
      csv_text = File.read(path_file)
      csv = CSV.parse(csv_text, :headers => true, :col_sep => col_sep)
      csv.each do |row|
        @authors.append(Author.new(row[0], row[1], row[2]))
      end
    end
  end
end
