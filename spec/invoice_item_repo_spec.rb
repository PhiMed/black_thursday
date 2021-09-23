
RSpec.describe do

  it 'exists' do
    ii = InvoiceItem.new({
                          :id => 6,
                          :item_id => 7,
                          :invoice_id => 8,
                          :quantity => 1,
                          :unit_price => BigDecimal(10.99, 4),
                          :created_at => Time.now,
                          :updated_at => Time.now
                          })
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    expect(invoice_items_repository).to be_an_instance_of(InvoiceItemRepository)
  end

  it 'can return and array of all known invoice items' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    expect(invoice_items_repository.all[0]).to be_an_instance_of(InvoiceItem)
    expect(invoice_items_repository.all.count).to eq(21830)
  end

  it 'can find by id' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    example_invoice_item = invoice_items_repository.find_by_id(6)

    expect(invoice_items_repository.find_by_id(example_invoice_item)).to eq example_invoice_item
    expect(invoice_items_repository.find_by_id(99898013042)).to eq nil
  end

  it 'can find all by item id' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    example_invoice_item = invoice_items_repository.find_all_by_item_id(7)

    expect(invoice_items_repository.find_all_by_item_id(example_invoice_item)).to eq example_invoice_item
    expect(invoice_items_repository.find_all_by_item_id(99898013042)).to eq([])
  end

  it 'can find all by invoice id' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)
    example_invoice_item = invoice_items_repository.find_all_by_invoice_id(8)

    #may need example with invoice id vs item id

    expect(invoice_items_repository.find_all_by_invoice_id(example_invoice_item)).to eq example_invoice_item
    expect(invoice_items_repository.find_all_by_invoice_id(99898013042)).to eq([])
  end

  it 'can make a new highest_id' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    expect(invoice_items_repository.new_highest_id).to eq "21831"
  end

  it 'can make a new invoice_item' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    expect(invoice_items_repository.new_highest_id).to eq "21831"

    invoice_items_repository.create({
      id: invoice_items_repository.new_highest_id,
      item_id: "111111111",
      invoice_id: "1111",
      quantity: "1",
      unit_price: "1111",
      created_at: "now",
      updated_at: "just a moment ago"
      })

    expect(invoice_items_repository.new_highest_id).to eq "21832"
    expect(invoice_items_repository.find_by_id(21831)).not_to eq(nil)
  end

  it 'can update attributes' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)

    expect(invoice_items_repository.find_by_id(21831)).to eq(nil)
    # invoice_items_repository.create({:id => 21831})
    # invoice_items_repository.update({:id => 21831, :quantity => 10, :unit_price => 1300})


    expect((invoice_items_repository.find_by_id(21831)).quantity).to eq(10)
    expect((invoice_items_repository.find_by_id(21831)).unit_price).to eq(1300)
  end

  it 'can delete an invoice instance' do

    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)
    expect(invoice_items_repository.all.count).to eq 21830
    invoice_items_repository.delete_by_id("21830")
    expect(invoice_items_repository.all.count).to eq 21829
  end
