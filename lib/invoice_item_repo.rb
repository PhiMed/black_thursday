
  def delete_by_id(id)
    if find_by_id(id) != nil
    @all.delete(@all.find do |item|
      item.id == id
    end)
    end
  end
