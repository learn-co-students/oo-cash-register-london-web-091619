require 'pry'
class CashRegister
    attr_accessor :discount, :total

    def initialize(discount = 1)
        @total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        @pre_discount_total = self.total += (quantity * price)
        quantity.times { self.items << title }
        @last_transaction_value = price * quantity
    end

    def apply_discount
        if @discount == 20
            adjusted_discount = @discount / 100.00
            savings = adjusted_discount * @pre_discount_total
            @total = @pre_discount_total - savings
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_transaction_value
        self.items.pop
    end

    def items
        @items
    end
end
