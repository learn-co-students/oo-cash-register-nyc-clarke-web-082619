class CashRegister
    attr_accessor :total, :discount, :quantity, :price, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @price = price
        @quantity = quantity
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        i = quantity
        until i == 0 do
            @items << title
            i -= 1
        end
        self.last_item = price * quantity
    end

    def items
        @items
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            self.total -= (0.01 * @discount * @total).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_item
    end
end
