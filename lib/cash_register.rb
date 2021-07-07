
class CashRegister

def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
end

attr_accessor :total

def discount
@discount
end

def add_item(item, price, quantity = 1)
    price *= quantity
    self.total += price
    quantity.times do
     items << item 
    end
    quantity.times do
        prices << price
    end
end

def items
    @items
end

def prices
    @prices
end


def apply_discount
    if discount == nil 
        "There is no discount to apply."
    else
        self.total -= (self.total * (discount.to_f/100))
        "After the discount, the total comes to $#{self.total.to_i}."
    end

end

def void_last_transaction
    self.total -= prices.last
end

end
