class CashRegister
    attr_accessor :total
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @previous_total = 0
        @items = []
    end

    def discount
        @discount  
    end

    def add_item(title, price, quantity = 1)
        @previous_total = total
        quantity.times {items << title}
        @total += (price * quantity)
    end

    def apply_discount
        @total = @total * (100 - @discount) / 100.0
        @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_i}." 
    end

    def items
        @items 
    end

    def void_last_transaction
        @items.pop
        @total = @previous_total

    end
end
