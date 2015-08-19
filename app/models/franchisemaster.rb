class Franchisemaster < ActiveRecord::Base
  attr_accessible :address, :business_id, :effectivefrom, :emailid, :franchiseename, :franchisename, :franchisetype, :openingdate

  validates :franchisetype,:franchisename,:franchiseename,:emailid,:address,:openingdate,:effectivefrom,:presence => true
  validates :franchisetype,:franchisename,:franchiseename, :length => { :maximum =>10 }
  validates :franchisename, :uniqueness => true
end
