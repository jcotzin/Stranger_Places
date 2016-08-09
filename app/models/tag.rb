class Tag < ApplicationRecord
  has_many :placetags
  has_many :places, through: :placetags

end
