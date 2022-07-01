require 'csv'

def storage_persons()
    path = "data/authors.csv"
    if(File.exist?(path)) 
        CSV.foreach(path, col_sep: ';', headers: true) do |row|
            Person.new(row[0], row[1], row[2])
        end
    else 
      puts "ERROR"
    end
end

def storage_literary_works(type, name)
    path = "data/#{name}.csv"
    if(File.exist?(path)) 
        CSV.foreach(path, col_sep: ';', headers: true) do |row|
            # :title, :isbn, :autors, :type , :description, :publishedAt
            description = type == "book" ? row[3] : ""
            publishedAt = type == "magazine" ? row[3] : ""
            # autors = row[2].split(',')
            autors = row[2]
            LiteraryWork.new(row[0], row[1], autors, type, description, publishedAt)
        end
    else 
      puts "ERROR"
    end
end

class Person
    @@array = Array.new
    attr_accessor :email, :firstName, :lastName

    def self.all_instances
        @@array
    end

    def initialize(email, firstName, lastName)
        @email = email
        @firstName = firstName
        @lastName = lastName
        @@array << self
    end

    def self.finfByEmail(email)
        person =  Person.all_instances.select{ |p| p.email == email }
        return person[0]
    end
end

class LiteraryWork
    @@array = Array.new
    attr_accessor :title, :isbn, :autors, :type , :description, :publishedAt

    def self.all_instances
        @@array
    end

    def initialize(title,isbn,autors,type,description,publishedAt)
        @title = title
        @isbn = isbn
        @autors = autors
        @type = type
        @description = description
        @publishedAt = publishedAt
        @@array << self
    end

    def self.printLiteraryWorks
        LiteraryWork.all_instances.each do |row|
            printLiteraryWork(row)
        end
    end

    def self.printLiteraryWork(lw)
        dsc = lw.type == "book" ? lw.description : "publicado: #{lw.publishedAt}"
        tipo = lw.type == "book" ? "Libro" : "Revista"
        puts %{
            Titulo #{lw.title}
            isbn: #{lw.isbn}
            autors: #{lw.autors}
            tipo: #{tipo}
            #{dsc}}
    end

    def self.filterByType(type)
        return  LiteraryWork.all_instances.select{ |l| l.type == type }
    end

    def self.filterLWbyIsbn(type, isbn_search)
        return  LiteraryWork.all_instances.select{ |l|  l.type == type && l.isbn == isbn_search }
    end

    def self.filterbyAutor(type, author)
        return  LiteraryWork.all_instances.select{ |l|  l.type == type && l.autors == author }
    end

    def self.filterbyTitle(type, t)
        return  LiteraryWork.all_instances.select{ |l|  l.type == type && l.title == t }
    end

end

if __FILE__ == $0
    storage_persons()
    storage_literary_works("book", "books")
    storage_literary_works("magazine", "magazines")

    puts "**** Todas las obras literarias ****"
    LiteraryWork.printLiteraryWorks

    puts "**** Libro por isbn ****"
    l = LiteraryWork.filterLWbyIsbn("book", "2145-8548-3325")
    puts LiteraryWork.printLiteraryWork(l[0])

    puts "**** Revista por isbn ****"
    magazineisbn = LiteraryWork.filterLWbyIsbn("magazine", "1313-4545-8875")
    puts LiteraryWork.printLiteraryWork(magazineisbn[0])

    puts "**** Obras por email ****"
    obrasporAutor= LiteraryWork.filterbyAutor("book", "null-walter@echocat.org")
    obrasporAutor.each do |row|
        LiteraryWork.printLiteraryWork(row)
    end

    puts "**** Obras por titulo ****"
    byTitle = LiteraryWork.filterbyTitle("book", "Schlank im Schlaf ")
    LiteraryWork.printLiteraryWork(byTitle[0])


    

end