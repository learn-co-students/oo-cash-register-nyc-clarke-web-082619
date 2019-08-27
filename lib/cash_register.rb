class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(item, price, quantity=1)
        self.total += quantity*price
        self.items.fill(item,self.items.size,quantity)
        self.last_transaction = [item,price,quantity]
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        end
        self.total = (self.total)*(1-(self.discount/100.0))
        return "After the discount, the total comes to $#{self.total.to_int}."
    end

    def void_last_transaction
        self.total -= self.last_transaction[1]*self.last_transaction[2]
    end
        
end