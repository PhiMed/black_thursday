require_relative './sales_engine'

class ItemRepository
  attr_reader :all

  def initialize(item_path)
    @all = (
      item_objects = []
      CSV.foreach(item_path, headers: true, header_converters: :symbol) do |row|
        item_objects << Item.new(row)
      end
    item_objects)
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def find_by_id(id)
    if (@all.any? do |item|
      item.id == id
    end) == true
      @all.find do |item|
        item.id == id
      end
    else
      nil
    end
  end

  def find_by_name(name)
    if (@all.any? do |item|
      item.name.upcase == name.upcase
    end) == true
      @all.find do |item|
        item.name.upcase == name.upcase
      end
    else
      nil
    end
  end

  def find_all_with_description(description)
    if (@all.any? do |item|
      item.description == description
    end) == true
      @all.find_all do |item|
        item.description == description
      end
    else
      []
    end
  end

  def find_all_by_price(unit_price)
    # @unit_price.to_f.to_s

    if (@all.any? do |item|
      item.unit_price == unit_price
    end) == true
      @all.find_all do |item|
        item.unit_price == unit_price
      end
    else
      []
    end
  end

  def find_all_by_price_in_range(range)
    in_range = []

    @all.each do |item|

      if item.unit_price.to_i >= range.first && item.unit_price.to_i <= range.last
        in_range << item
      end
    end
      in_range
  end

  def find_all_by_merchant_id(merchant_id)
    if (@all.any? do |item|
      item.merchant_id == merchant_id
    end) == true
      @all.find_all do |item|
      item.merchant_id == merchant_id
      end
    else
      []
    end
  end

  def find_highest
        max = 0
    container = []
    @all.each do |item|
        container << item.id.to_i
      end
    container.each do |item|
      if item > max
        max = item
      end
    end
    max
  end

  def new_highest_id
    find_highest + 1
  end

  def create
    item_repo_new = ItemRepository.new(attributes)
    @all << item_repo_new
  end

  def delete(id)
    if find_by_id(id) != nil
      @all.delete(@all.find do |item|
        item.id == id
      end)
    end
  end

end
