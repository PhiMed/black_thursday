require 'csv'
require './lib/sales_engine'
require './lib/merchant'

class MerchantRepository
  attr_reader :merchants

  def initialize(data)
    @merchants = (data)
  end

  def all
    @merchants.map do |merchant|
      Merchant.new(merchant[:id], merchant[:name])
    end
  end
end
