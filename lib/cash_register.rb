class CashRegister
  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(name, price, quantity = 1)
    @items += [name] * quantity
    @total += price * quantity
    @transactions << { name: name, price: price, quantity: quantity }
  end

  def apply_discount
    return 'There is no discount to apply.' if @discount.eql?(0)

    @total *= (100.00 - @discount) / 100.00
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @transactions.pop
    @total = @transactions.reduce(0) do |total, transaction|
      total + transaction[:price] * transaction[:quantity]
    end
  end
end
