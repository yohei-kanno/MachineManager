class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.human(column)
    human_attribute_name(column)
  end
end
