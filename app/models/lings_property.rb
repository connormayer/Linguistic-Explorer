class LingsProperty < ActiveRecord::Base
  validates_presence_of :value
  validates_presence_of :ling_id
  validates_presence_of :property_id

  belongs_to :ling
  belongs_to :property
end
