#!/usr/bin/env ruby

# Reference for tests
# https://docs.google.com/spreadsheets/d/1J0Fya6W2FF9O9fdmvLSgunAYQudbYGkdY-rf6zXV13g/edit#gid=0

require_relative 'theater'
require "test/unit"

class TestPerformanceProfit < Test::Unit::TestCase

  def setup
    @profit = PerformanceProfit.new
  end

  def test_best_price
    assert_equal([290, 106410], @profit.calc_best_price)
  end

  def test_calculate_cost_and_profit_with_no_attendance
    attendance = 0
    assert_equal(-180 * 100, @profit.calc_profit(580, attendance) )
    assert_equal(180 * 100, @profit.calc_cost(attendance) )
  end

  def test_calculate_cost_and_profit_with_lower_price
    # 10 cents
    attendance = 855
    assert_equal(-12870, @profit.calc_profit(10, attendance) )
    assert_equal(21420, @profit.calc_cost(attendance) )
  end

  def test_calculate_cost_and_profit_of_best_price
    # 290 cents
    attendance = 435
    assert_equal(106410, @profit.calc_profit(290, attendance) )
    assert_equal(19740, @profit.calc_cost(attendance) )
  end

end