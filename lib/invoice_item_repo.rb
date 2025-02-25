require './lib/invoiceitem'
require './lib/sales_engine'
require 'csv'
require 'BigDecimal'

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
      item.id == id
    end
    else
      nil
    end
  end

  def find_all_by_item_id(item_id)
    if (@all.any? do |item|
      item.item_id == item_id
    end) == true
    @all.find_all do |item|
      item.item_id == item_id
    end
    else
      []
    end
  end

  def find_all_by_invoice_id(invoice_id)
    if (@all.any? do |item|
      item.invoice_id == invoice_id
    end) == true
    @all.find_all do |item|
      item.invoice_id == invoice_id
    end
    else
      []
    end
  end

  def new_highest_id
      last = @all.last
      new_high = last.id.to_i
      new_high += 1
      new_high.to_s
  end

  def create(attributes)
    iinew = InvoiceItemRepository.new(attributes)
    @all << iinew
  end

  def delete_by_id(id)
    if find_by_id(id) != nil
      @all.delete(@all.find do |item|
        item.id == id
      end)
    end
  end
end
