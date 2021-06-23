module PlacesHelper
  
  def count_of_pachinko(place)
    place.store.machines.where("place = ?", place.name).where("form_type = ?", "pachinko").count
  end
  
  def count_of_slot(place)
    place.store.machines.where("place = ?", place.name).where("form_type = ?", "slot").count
  end
  
  def count_of_all(place)
    place.store.machines.where("place = ?",place.name).count
  end
end
