# Considerations: a paper can have only one author

require 'csv'

class Paper
  attr_reader :title, :isbn, :authors, :description, :published_at

  def initialize (title, isbn, authors, description = nil, published_at = nil)
    # @type= ""
    @title = title
    @isbn = isbn
    @authors = authors
    @description = description
    @published_at = published_at
  end
end

class Library

  def initialize(papers = nil, authors = nil)
    if papers != nil
      @papers_sources = papers
    else
      @papers_sources = ["books.csv", "magazines.csv"]
    end
    if authors != nil
      @authors_sources = authors
    else
      @authors_sources = ["authors.csv"]
    end

    @papers = []
    @authors = []
  end

  def load
    load_papers
    # load_authors
  end

  def load_papers
    @papers_sources.each do |paper_file|
        data = CSV.read(paper_file)
        puts data
        data.each do |paper_data|
          # paper = Paper.new(paper_data[])
        end
    end
  end

  # def load_authors
  #
  # end
end
