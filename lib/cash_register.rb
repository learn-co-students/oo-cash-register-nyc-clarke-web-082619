class CashRegister

  attr_accessor :total, :discount, :prices
  def initialize(discount=nil)
    @total = 0
    @titles = []
    @discount = discount
    @prices = {}
    @number = 0
  end
    
  def add_item(title, price, quantity=nil)
    quantity ? quantity.times{@titles << title} : @titles << title 
    @prices[title] = price
    @number = quantity if quantity != nil
    (quantity != nil) ? @total += (quantity * price) : @total += price
  end 
 
  def apply_discount
   if @discount
    self.total -= (self.total * self.discount / 100.0)
      return "After the discount, the total comes to $#{self.total.to_i}."
   end  
    "There is no discount to apply."
  end

  def items
   @titles
  end

  def void_last_transaction
    item_to_remove = @prices[@titles.pop]
    @number == 0 ? self.total -= item_to_remove : self.total -= (item_to_remove * @number)
    self.total 
  end

end