class CashRegister
    attr_reader :discount 
    attr_accessor :total, :title, :price, :last_amount

    def initialize(discount=nil)
        @total = 0
        @discount = discount  
        @title = []
    end

    def add_item(title, price, quantity=nil)
        @title << title
        if quantity 
            price *= quantity
            quantity -= 1
            quantity.times{|i| @title << title}
        end
            @last_amount = price 
            self.total += price
    end

    def apply_discount
        if self.discount
            @discount = (100.0 - @discount) / 100.0 
            self.total *= self.discount
            "After the discount, the total comes to $#{self.total.round}."
        else 
            "There is no discount to apply."
        end 
    end

    def items
        @title
    end

    def void_last_transaction
        @total -= @last_amount
    end

end
