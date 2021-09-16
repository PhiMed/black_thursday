require './lib/item'
require './lib/sales_engine'
require './lib/item_repository'
require 'csv'
require 'bigdecimal'
require 'pry'

RSpec.describe do
  it 'exists' do
    test = ItemRepository.new(true)
    se = SalesEngine.from_csv({
    :items     => "./data/items.csv",
    :merchants => "./data/merchants.csv"
    })

    ir = se.items

    expect(ir).not_to eq nil
  end

  # xit '' do
  #   se = SalesEngine.from_csv({
  #   :items     => "./data/items.csv",
  #   :merchants => "./data/merchants.csv"
  #   })
  #
  #   expect(.all).to eq()
  # end

  xit 'can find item by name' do
    se = SalesEngine.from_csv({
    :items     => "./data/items.csv",
    :merchants => "./data/merchants.csv"
    })
    ir = se.items

    item = ir.find_by_name("Item Repellat Dolorum")
    expect(item).to eq("Item Repellat Dolorum")
  end

end
