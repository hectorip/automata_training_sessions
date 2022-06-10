# https://github.com/dabeaz/theater
#
# The owner of a monopolistic movie theater in a small town has
# complete freedom in setting ticket prices.  The more he charges, the
# fewer people can afford tickets.  The less he charges, the more it
# costs to run a show because attendance goes up.  In a recent
# experiment the owner determined a relationship between the price of
# a ticket and average attendance.
#
# At a price of $5.00/ticket, 120 people attend a performance.  For
# each 10-cent change in the ticket price, the average attendance
# changes by 15 people.  That is, if the owner charges $5.10, some 105
# people attend on the average; if the price goes down to $4.90,
# average attendance increases to 135.
#
# Unfortunately, the increased attendance also comes at an increased
# cost.  Every performance comes at a fixed cost of $180 to the owner
# plus a variable cost of $0.04 per attendee.
#
# The owner would like to know the exact relationship between profit
# and ticket price in order to maximize the profit.
#
# Write a program to figure out the best ticket price (to the nearest
# 10 cents) that maximizes profit.
#
# Credit: This problem comes from "How to Design Programs", 2nd Ed.
# by Felleisen, Findler, Flatt, and Krishnamurthi.  pg. 60.

def get_income(ticket_price_cents, attendees)

	fixed_cost_cents = 18000
	var_cost_cents = 4
	
	net_income = ticket_price_cents * attendees
	net_cost = fixed_cost_cents + (var_cost_cents * attendees)
	
	final_income = net_income - net_cost
	return final_income
end

def generate_incomes(generations_amount=10)
	ticket_price_cents_up = 500
	ticket_price_cents_down = 500

	attendees_up = 120
	attendees_down = 120

	incomes = {}

	for ten_cents in 0..generations_amount/2

		# puts "--"
		# puts ten_cents
		income_up = get_income(ticket_price_cents_up, attendees_up)
		income_down = get_income(ticket_price_cents_down, attendees_down)

		
		incomes[ticket_price_cents_up] = income_up
		incomes[ticket_price_cents_down] = income_down
		
		# puts incomes.length()
		
		ticket_price_cents_up += 10
		ticket_price_cents_down -= 10
		
		attendees_up -= 15
		attendees_down += 15
		

	end
	return incomes
end

def max_revenue(incomes)
	
	ticket = ""
	max_revenue_aux = 0

	incomes.each do |key, value|
		puts "ticket: #{key} - profit: #{value}"

		if (value > max_revenue_aux)
			max_revenue_aux = value
			ticket = key
		end

	end

	puts "ticket: #{ticket} revenue #{max_revenue_aux} "
end

if __FILE__ == $0
	

	incomes = generate_incomes()

	max_revenue(incomes)

end