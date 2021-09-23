require './lib/merchant_repository'

RSpec.describe MerchantRepository do

  before :each do
    merchants_path = './data/merchants.csv'
    @merchant_repository = MerchantRepository.new(merchants_path)
  end

  it "exists" do
    expect(@merchant_repository).to be_an_instance_of(MerchantRepository)
  end

  it 'can return an array of all known merchants' do
    expect(@merchant_repository.all[0]).to be_an_instance_of(Merchant)
    expect(@merchant_repository.all.count).to eq 475
  end

  it 'can find merchant by id' do
    example_merchant = @merchant_repository.all[25]
    expect(@merchant_repository.find_by_id(example_merchant.id)).to eq example_merchant
    expect(@merchant_repository.find_by_id(12335971)).to eq nil
  end

  it 'can find merchants by name' do
    example_merchant = @merchant_repository.all[25]
    expect(@merchant_repository.find_by_name(example_merchant.name)).to eq example_merchant
    expect(@merchant_repository.find_by_name("woody woodpecker")).to eq nil
  end

  it 'can make a new highest_id' do
    merchants_path = './data/merchants.csv'
    merchant_repository = MerchantRepository.new(merchants_path)

    expect(merchant_repository.new_highest_id).to eq "12337412"

  it 'can make a new transaction' do
    merchants_path = './data/merchants.csv'
    merchant_repository = MerchantRepository.new(merchants_path)

    expect(merchant_repository.new_highest_id).to eq "12337412"

    merchant_repository.create({
      id: merchant_repository.new_highest_id,
      invoice_id: "111",
      credit_card_number: "1111111111111111",
      credit_card_expiration_date: "1111",
      result: "success",
      created_at: "now",
      updated_at: "just a moment ago"
      })

      expect(merchant_repository.new_highest_id).to eq "12337413"
      expect(merchant_repository.find_by_id(4986)).not_to eq([])
  end

  it 'can update merchant attributes using ID' do
    @merchant_repository.create(:name => "Shopkeep0", :id => 12337412)
    @merchant_repository.update(12337412, "ThisTestWillPass")
    expect((@merchant_repository.find_by_id(12337412)).name).to eq "ThisTestWillPass"
  end

  it 'can delete a merchant by ID' do
    @merchant_repository.create(:name => "Shopkeep0", :id => 12337412)
    expect(@merchant_repository.all.count).to eq 476
    @merchant_repository.delete(12337412)
    expect(@merchant_repository.all.count).to eq 475
 end
end
