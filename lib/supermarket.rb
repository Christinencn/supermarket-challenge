class Supermarket
  attr_reader :trolley

  def initialize
    @trolley = []
  end

  def list
    {beans:1, banana:2, broccoli:1, bacon:3}
  end

  def add(food)
    raise 'This item is out of stock' if list[food.to_sym] == nil
    @trolley.push(food)
  end

  def price(items) #items is a placeholder for data that i can use when i call the method.
     list[items.to_sym]
  end

  def total(trolley)
    total = 0
    count = 0
    trolley.each { |item| total += price(item) }
    total -= discount if trolley.count('banana') > 1
    total
  end

  private
    def discount
      trolley
      free_bananas = trolley.count('banana') / 2
      f = free_bananas * 2
      f
    end
end
