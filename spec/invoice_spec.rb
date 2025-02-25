require './lib/invoice'

RSpec.describe do
  it "exists" do
    i = Invoice.new({
      :id          => 6,
      :customer_id => 7,
      :merchant_id => 8,
      :status      => "pending",
      :created_at  => Time.now,
      :updated_at  => Time.now,
    })

    expect(i).to be_an_instance_of(Invoice)
  end

  it "has attributes" do
    i = Invoice.new({
      :id          => 6,
      :customer_id => 7,
      :merchant_id => 8,
      :status      => "pending",
      :created_at  => Time.now,
      :updated_at  => Time.now,
    })

    expect(i.id).to eq(6)
    expect(i.customer_id).to eq(7)
    expect(i.merchant_id).to eq(8)
    expect(i.status).to eq("pending")
    expect(i.created_at).to be_an_instance_of(Time)
    expect(i.updated_at).to be_an_instance_of(Time)
  end
end
