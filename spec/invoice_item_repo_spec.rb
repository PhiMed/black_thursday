
  it 'can delete an invoice instance' do
    invoice_items_path = './data/invoice_items.csv'
    invoice_items_repository = InvoiceItemRepository.new(invoice_items_path)
    expect(invoice_items_repository.all.count).to eq 21830
    invoice_items_repository.delete_by_id("21830")
    expect(invoice_items_repository.all.count).to eq 21829
  end
