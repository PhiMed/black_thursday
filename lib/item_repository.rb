require './lib/sales_engine'
require 'csv'

class ItemRepository
  attr_reader :items
  def initialize(data)
    @items = data
  end
#find_by_name incomplete
  def find_by_name(item_name)
    @items.find do|item|
      item == item_name
    end
  end
end
