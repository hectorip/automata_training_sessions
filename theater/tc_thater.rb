# File:  tc_simple_number2.rb

require_relative "thater"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_find_best
    assert_equal(2.9000000000000017, get_best_price(1,100))
  end

  def test_rule_5_dollars
    assert_equal(120, get_people_by_ticket_cost(5))
  end

  def test_rule_510_dollars
    assert_equal(105.00000000000006, get_people_by_ticket_cost(5.10))
  end

  def test_rule_510_dollars_rounded
    rounded = get_people_by_ticket_cost(5.10).round()
    assert_equal(105, rounded)
  end

  def test_rule_490_dollars
    assert_equal(134.99999999999994, get_people_by_ticket_cost(4.90))
  end

end