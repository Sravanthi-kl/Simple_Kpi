FactoryGirl.define do
  factory :bk_datum, :class => 'BkData' do
    logDate "2015-08-10"
actualValue 1
targetPercentage "9.99"
targetValue 1
notes "MyText"
kpi_id 1
business_id 1
businesskpi_id 1
  end

end
