require "pry"

class CashRegister

  attr_accessor :total, :discount
  attr_reader :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    counter = quantity
    while counter >= 1
      @items << title
      counter -= 1
    end
    @total += price * quantity
    @last_item_price = price
  end

  def apply_discount
    if @discount > 0
      @total = @total - (@total * ((@discount.to_f)/100))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_item_price
  end

end

binding.pry
