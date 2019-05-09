class GildedRose

  def initialize(items)
    @items = items
  end

  def normal_update(item)
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
    item.quality = 0 if item.quality < 0
    item.sell_in -= 1
  end

  def brie_update(item)
    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1
  end

  def pass_update(item)
    item.quality += 1
    item.quality += 1 if item.sell_in <= 10
    item.quality += 1 if item.sell_in <= 5
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.sell_in <= 0
    item.sell_in -= 1
  end

  def update_quality()
    @items.each do |item|
      if item.name == "foo"
        return normal_update(item)
      end
      if item.name == "Aged Brie"
        return brie_update(item)
      end
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        return pass_update(item)
      end
      if item.name == "Sulfuras, Hand of Ragnaros"
        return
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
