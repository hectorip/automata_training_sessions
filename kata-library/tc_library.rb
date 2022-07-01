# File:  tc_simple_number2.rb

require_relative "library"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_read_exist_csv
    assert  read_file_csv('authors').length > 0
  end

  def test_csv_no_exists
    assert  read_file_csv('authors1').length == 0
  end


end