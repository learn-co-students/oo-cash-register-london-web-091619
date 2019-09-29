class CashRegister

    attr_accessor :total, :discount

    def initialize(discount = 1)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @amount = self.total += (price * quantity)
        quantity.times { @items << item }
        @item_total = price * quantity
    end

    def apply_discount
        if @discount == 20
            altered_discount = @discount / 100.0
            savings = altered_discount * @amount
            @total = @amount - savings
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @item_total
        self.items.pop
    end

    def items
        @items
    end

end
