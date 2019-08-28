require "pry"
class CashRegister
    attr_accessor :discount, :total
    attr_reader :items, :last_transaction
    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end
    def add_item(item, price, quantity = 1)
        @total += price * quantity
        quantity.times do
        @items << item
        @last_transaction = {:item => item, :price => price, :quantity => quantity}
        end
    end
    def apply_discount
        if @discount
            @total -= (@total * discount/100).round(2)
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        @total -= self.last_transaction[:price] * self.last_transaction[:quantity]
        self.last_transaction[:quantity].times do
            self.items.pop
        end
        if self.items == []
            self.total = 0
        end
        #binding.pry

    end
  
end

