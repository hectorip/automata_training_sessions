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
# TODO: Transformar a centavos

#numero de personas dependiendo del costo del boleto
 def get_people_by_ticket_cost(cost)
    people_initial = 120
    cost_inicial= 5
    variation = 15

    people = people_initial  - ( (cost - cost_inicial) * (variation / 0.1 ))
    return people
end
 
# costo del show
def cost_show(cost)
    total_show = 180 + (0.04 * get_people_by_ticket_cost(cost))
    return total_show
end

# ganancias totales
def ganancias_totales(cost)
    ganancias = cost* get_people_by_ticket_cost(cost)
    return ganancias
end

def ganancia_final(cost)
    return ganancias_totales(cost) - cost_show(cost)
end

def get_best_price(init, final)
    bestGanancia = 0
    bestPrice = 0

    price = init
    while price < final
        gf = ganancia_final(price)
        if gf > bestGanancia
            bestGanancia = gf
            bestPrice = price
        end
        price = price + 0.1
    end
    return bestPrice
end


  if __FILE__ == $0
    puts get_best_price(1, 100)
  end