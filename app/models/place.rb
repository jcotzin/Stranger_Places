class Place < ApplicationRecord
  has_many :images
  has_many :placetags
  has_many :tags, through: :placetags
  has_many :videos

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :description, :latitude, :longitude, :city, :state_province, :country

    attributesToIndex ['name', 'city', 'state_province', 'country', 'unordered(description)']
  end
end
