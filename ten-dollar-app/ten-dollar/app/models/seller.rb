class Seller
  include Mongoid::Document
  field :username, type: String
  field :password, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :email, type: String
  has_many :items
  validates_uniqueness_of :username

end
