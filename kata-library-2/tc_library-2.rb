
# File:  tc_simple_number2.rb

require_relative "library-2"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_load_all_autors
    storage_persons()
    assert_equal  Person.all_instances.length, 6
  end

  def test_load_all_books
    storage_literary_works("book", "books")
    assert_equal  LiteraryWork.all_instances.length, 8
  end

  def test_load_all_magazines
    storage_literary_works("magazine", "magazines")
    # assert_equal  LiteraryWork.all_instances.length, 6
  end

  # def test_book_has_description
  #   assert_equal  LiteraryWork.all_instances.length, 6
  # end




end