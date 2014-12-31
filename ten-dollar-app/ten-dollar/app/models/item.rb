class Item
  include Mongoid::Document
  field :item_tag, type: String
  field :description, type: String
  field :photo, type: String
  field :category, type: String
  field :search_tags, type: String
  field :shipping_cost, type: Float
  field :sold, type: Mongoid::Boolean
  belongs_to :seller
end
