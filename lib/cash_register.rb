class CashRegister 

    attr_accessor :total, :discount
    attr_reader :items, :price

    def initialize(discount= 0)
        @total = 0
        @discount= discount
        @items = []
        @price = []
    end

        
    def add_item(item,price,quantity=1)
        @total +=(price *quantity)
        quantity.times do 
            @items << item 
            @price = price
            @quantity = quantity
        end
        
    end

    def apply_discount
        if @discount > 0
            @total -= ((@discount/100.0) * @total).round
            return "After the discount, the total comes to $#{@total}."
        end
        return "There is no discount to apply."
    end

    def void_last_transaction
        @quantity.times do 
        @total -= price 
        @items.pop
        end
    end


end
