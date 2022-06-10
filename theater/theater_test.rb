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
    assert_equal(-180 * 100, @profit.calc_profit(580, 0) )
    assert_equal(180 * 100, @profit.calc_cost(0) )
  end

end