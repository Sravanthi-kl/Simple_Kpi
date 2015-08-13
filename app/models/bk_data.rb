class BkData < ActiveRecord::Base
  attr_accessible :actualValue, :business_id, :businesskpi_id, :kpi_id, :logDate, :notes, :targetPercentage, :targetValue
  belongs_to :kpi
  belongs_to :business
  belongs_to :businesskpi
end
