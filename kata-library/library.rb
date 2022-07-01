=begin 
1. Your software should read all data from the given CSV files in a meaningful structure.
  - Metodo para leer un archivo csv
  - Crear una forma en la que guarde la informacion 
    eficientemente para ser consultada despues. Decidi una clase
    pero se me dificulta.
=end
require 'csv'

# email;firstname;lastname
class Author
  attr_accessor :email, :firstname, :lastname

  def initialize(email, firstname, lastname)
    @email = email
    @firstname = firstname
    @lastname = lastname
  end

  def getInfo
    return "email: #{@email}, complete name: #{@firstname} #{@lastname} "
  end
end

class Book
  attr_accessor :title, :description, :authors, :isbn

  def initialize(title, description, authors, isbn)
    @title: title
    @description: description
    @authors: authors
    @isbn: isbn
  end

  def getInfo
    return "title: #{@title} "
  end
end

def read_file_csv(name)
  path = "data/#{name}.csv"
  if(File.exist?(path)) 
    file = CSV.read(path, col_sep: ';', headers: false)
  return file
  else 
    return []
  end
end

 


if __FILE__ == $0
  autors = read_file_csv('authors')

  a= []
  autors.each do |row|
    a.push(Author.new(row[0], row[1], row[2]))
  end


  books = read_file_csv('books')
  magazines = read_file_csv('magazines')

  a = Author.new('mail0', 'fuir0', 'las')
  puts a.getEmail
end