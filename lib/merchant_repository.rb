require 'csv'
require './lib/sales_engine'
require './lib/merchant'

class MerchantRepository
  attr_reader :all

  def initialize
  end

  def all
    all_item_data = []
    CSV.foreach(data[:items], headers: true) do |row|
      all_item_data << row.to_hash
    end
    
  #CSV.open("path/to/file.csv", "wb") do |csv|

  def find_by_id(id)
    @all.find do |merchant|
      merchant[:id] == (id)
    end
  end
end
