# item1 = {:item => "sword", :color => "silver", :price => 200}

# item2 = {item: "helmet", color: "black", price: 150}

# item3 = {"item" => "laptop", "color" => "red", "price" => 600}

# p "You can buy a #{item1[:color]} #{item1[:item]} for $#{item1[:price]}."

# p "You can buy a #{item2[:color]} #{item2[:item]} for $#{item2[:price]}."

# p "You can buy a #{item3["color"]} #{item3["item"]} for $#{item3["price"]}."

# store_items = []
# index = 0

class Items
  
  attr_reader :item, :item_color, :item_price

  def initialize(item_description)
    @item = item_description[:item]
    @item_color = item_description[:item_color]
    @item_price = item_description[:item_price]
  end

end

item_1 = Items.new(:item => "sword", :item_color => "silver", :item_price => 200)
p "You can buy a #{item_1.item_color} #{item_1.item} for $#{item_1.item_price}."









# item = Hash.new
# p "Item:"
# answer = gets.chomp
# item["Item"] = answer

# p item


# p "Color:"
# color = gets.chomp
# items[index] << color
# p items
