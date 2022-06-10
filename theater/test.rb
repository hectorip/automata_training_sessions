require_relative "thater"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

	def test_income
		assert_equal 41520, get_income(500, 120)
	end

	def test_generation
		generations_amount = 10
		incomes = generate_incomes(generations_amount)
		assert_equal incomes.length(), generations_amount+1, "#{incomes.length()} no es #{generations_amount}"

		generations_amount = 11
		incomes = generate_incomes(generations_amount)
		assert_equal incomes.length(), generations_amount+1, "#{incomes.length()} no es #{generations_amount}"

	end
end