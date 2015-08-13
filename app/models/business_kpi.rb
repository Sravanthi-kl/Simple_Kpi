class BusinessKpi < ActiveRecord::Base
  attr_accessible :business_id, :kpi_id
    
  belongs_to :kpi
  belongs_to :business
  has_many :bkdetails
  validates :kpi_id, :uniqueness => true
end
