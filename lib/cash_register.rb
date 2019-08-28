require 'pry'

class CashRegister
    def initialize(employee_discount = 0)
        @total = 0
        @discount = employee_discount
        @items = []
        @last_price = []
        @last_transaction = []
    end


    attr_accessor :discount, :total, :last_price, :items, :last_transaction

    def add_item(item, price, quantity = 1)
        quantity.times do
            self.items << item
            self.last_price << price
            self.total += price
        end
        self.last_transaction << {:item => item, :price => price, :quantity => quantity}
    end

    def apply_discount
        if (self.discount == 0) then
            return "There is no discount to apply."
        end
        self.total -= self.total * (self.discount * 0.01)

        return "After the discount, the total comes to $#{self.total.to_int}."
    end

    def void_last_transaction
        count = self.last_transaction.last[:quantity]
        refund = count * self.last_transaction.last[:price]

        count.times do
            self.items.pop
        end

        self.total -= refund
    end

end
