
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
      # require "pry"; binding.pry
  end

  def create(attributes)
    iinew = InvoiceItemRepository.new(attributes)
    @all << iinew
  end
end

def update(id, attribute)
  if find_by_id(id) != nil
    find_by_id(id).status.clear.gsub!("", attribute[:quantity], attribute[:unit_price])
    find_by_id(id).updated_at.clear.gsub!("", Time.now.to_s)
  end
end

# def delete(id)
#   if find_by_id(id) != nil
#     @all.delete(@all.find do |item|
#       merchant.id == id
#     end)
#   end
# end
# end





# Code below is from the Item Repository and needs to begin
# adjusted to be used in this repo
