class CashRegister
    
    attr_accessor :items, :total, :last_transaction, :discount

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end
    
   

    def add_item(item, price, quantity=1)
        self.total += (price * quantity) 
        quantity.times do 
            @items << item
        end
        self.last_transaction = price * quantity
    end


    def apply_discount
        if discount == nil
            "There is no discount to apply."
        else 
            @total -= (@total * (discount.to_f/100))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        
        self.total -= self.last_transaction
    end

end
