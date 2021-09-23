class InvoiceItemRepository
  attr_reader :all

  def initialize(invoice_items_path)
    @all = (
      invoice_items_objects = []
      CSV.foreach(invoice_items_path, headers: true, header_converters: :symbol) do |row|
        invoice_items_objects << InvoiceItem.new(row)
      end
      invoice_items_objects)
  end

  def find_by_id(id)
    if (@all.any? do |item|
      item.id == id
    end) == true
    @all.find do |item|
  end

  def delete_by_id(id)
    if find_by_id(id) != nil
    @all.delete(@all.find do |item|
      item.id == id
    end)
  end

  def new_highest_id
    last = @all.last
    new_high = last.id.to_i
    new_high += 1
    new_high.to_s
  end

  def create(attributes)
    new_iir = InvoiceItemRepository.new(attributes)
    @all << new_iir
  end

  def update(id, attribute)
    if find_by_id(id) != nil
      find_by_id(id).status.clear.gsub!("", attribute[:quantity], attribute[:unit_price])
      find_by_id(id).updated_at.clear.gsub!("", Time.now.to_s)
    end
  end
end



