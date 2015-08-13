class Kpi < ActiveRecord::Base
  attr_accessible :KPICategory, :KPIDirection, :KPIEntryPeriod, :KPIName, :KPITargetValue, :KPIUnitName, :active
  
  has_many :bkdetails
  has_many :businesskpi

  validates :KPICategory, :KPIDirection, :KPIEntryPeriod, :KPIName, :KPITargetValue, :KPIUnitName,:presence => true
  validates :KPIName, :length => { :maximum =>10 }
  validates :KPIName,:uniqueness => true
 
end
