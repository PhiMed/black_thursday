require './lib/merchant_repository'

RSpec.describe MerchantRepository do
  it "exists" do
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      })
    mr = MerchantRepository.new(se)

    expect(mr).to be_an_instance_of(MerchantRepository)
  end

  it 'can return an array of all known merchants' do
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      })
    mr = MerchantRepository.new(se)
    expect(mr.all).not_to eq nil
  end

  it 'can find merchant by id' do
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      })
    mr = MerchantRepository.new(se)
    expect(mr.find_by_id(12334123)).to eq({"id"=>"12334123", "name"=>"Keckenbauer",
       "created_at"=>"2010-07-15", "updated_at"=>"2012-07-25"})
  end
end
