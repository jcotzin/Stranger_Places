class Place < ApplicationRecord
include AlgoliaSearch
  has_many :images
  has_many :placetags
  has_many :tags, through: :placetags
  has_many :videos
  

  has_and_belongs_to_many :users

  #not sure where this goes to index our model
  # Place.algolia_reindex

  algoliasearch do
    attribute :name, :description, :latitude, :longitude, :city, :state_province, :country, :airport, :main_img
    #all above attributes + extra_attr will be sent
    # add_attribute :extra_attr
    #attributesToIndex needs to be listed by order of importance
    attributesToIndex ['name', 'city', 'state_province', 'country', 'country', 'airport', 'main_img' 'unordered(description)']

    # tags used for filtering
    # tags do
    #   [item_type, "author_#{author}", "story_#{story_id}"]
    # end

    # the `customRanking` setting defines the ranking criteria use to compare two matching records in case their text-relevance is equal. It should reflect your record popularity.
    customRanking ['desc(likes_count)']
  end

  # def extra_attr
  #   "extra_val"
  # end
end
