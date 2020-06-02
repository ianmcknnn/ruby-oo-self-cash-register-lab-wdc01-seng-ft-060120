class CashRegister

  #getters and setters
  attr_reader :discount
  attr_accessor :total, :items, :prices

  #initialize values of instance variables
  def initialize(discount=0)
    @total = 0.0
    @discount = discount
    @items = []
    @prices = []
  end
  
  #increment @total by the total cost of the number of items being added
  #push title to @items and the total cost to @prices
  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times {@items << title; @prices << price * quantity}
  end

  #if there is a nonzero discount, decrement @total by 0.01 * @discount * @total 
  #(the discount as a decimal fraction of the current total) before converting 
  #@total to an integer and returning a message with the new total. Otherwise
  #return a message that there is no discount.
  def apply_discount
    (@discount != 0) ? (@total -= (0.01 * @discount * @total).to_i) 
    : (return "There is no discount to apply.")
    success = "After the discount, the total comes to $#{@total.to_i}."
  end

  #subtract the last price added to @prices from the total. @prices keeps track of 
  #the total cost of each collection of items added, so that (e.g.) adding five 
  #of one item is stored as a single price in the array
  def void_last_transaction
    @total -= @prices.pop
  end
  
end
