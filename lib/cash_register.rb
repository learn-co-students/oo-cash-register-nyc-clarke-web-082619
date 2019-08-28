

class CashRegister

    attr_accessor :total, :price, :quantity

    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @items = []
    end 

    def discount
        @discount
    end 

    def add_item(title, price, quantity = 1)
        quantity.times do
        @items << title
        end 
        @price = price
        @quantity = quantity 
        quantity > 1 ? self.total += (price * quantity) : self.total += price    
    end    
    
    def apply_discount
        if discount > 0 
            self.total -= (self.total.to_f * (discount/100.0))
            return "After the discount, the total comes to $#{self.total.to_i}."
        else 
            return "There is no discount to apply."
        end 
    end 

    def items
       @items
    end 

    def void_last_transaction 
        @quantity.times do 
            @items.pop 
        end 
        @total -= @quantity*@price 
    end 
end 
