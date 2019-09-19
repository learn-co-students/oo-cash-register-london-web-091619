class CashRegister

attr_accessor :discount, :total, :last_transaction

def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title,price, quantity = 1)
    self.total += price * quantity
    self.last_transaction = price * quantity
    quantity.times{@items << title}
  end

  def apply_discount
    if discount != 0
    self.total *= (100.0-self.discount)/100
    return "After the discount, the total comes to $#{self.total.to_i}."
  else
    return "There is no discount to apply."
  end
end

def items
return @items
end

def void_last_transaction
  self.total -= self.last_transaction
end

end
