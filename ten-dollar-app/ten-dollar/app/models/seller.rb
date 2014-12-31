class Seller
  include Mongoid::Document
  field :username, type: String
  field :password, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :email, type: String
  is_seller = false
  has_many :items

end
