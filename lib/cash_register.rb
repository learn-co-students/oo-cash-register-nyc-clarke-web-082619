require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :prices, :last_item

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = [ ]
        @prices = [ ]
        @last_item = { }
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            self.items << title
            self.total += price
        end
        self.last_item = {title: title, price: price, quantity: quantity}
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total - @total * @discount/100
            "After the discount, the total comes to $#{@total}."
        end
    end


    def void_last_transaction
        self.total = self.total - self.last_item[:price]*self.last_item[:quantity]
    end

end