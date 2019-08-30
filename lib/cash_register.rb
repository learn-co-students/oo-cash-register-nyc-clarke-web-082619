require "pry"

class CashRegister
   attr_accessor :discount, :total, :items, :last_transaction

   def initialize(discount = 0)
       @total = 0
       @discount = discount
       @items = []
   end

   def add_item(title, price, quantity = 1)
       @total += price * quantity
       @last_transaction = price * quantity

       i = 0
       while i < quantity
       @items << title
       i += 1
       end
       # @items << title
       # end
   end
  # binding.pry

  def apply_discount
      if discount == 0
       "There is no discount to apply."
      else
       @total -= (@total * (discount.to_f/100))
       "After the discount, the total comes to $#{@total.to_i}."
      end
  end
  #binding.pry

  def items
   @items
  end

  def void_last_transaction
   @total -= @last_transaction
  end
end