class Place < ApplicationRecord
  has_many :images
  has_many :placetags
  has_many :tags, through: :placetags
  has_many :videos
end
