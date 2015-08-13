class CreateBusinessKpiData < ActiveRecord::Migration
  def change
    create_table :business_kpi_data do |t|
      t.date :logDate
      t.integer :actualValue
      t.decimal :targetPercentage
      t.integer :targetValue
      t.text :notes
      t.integer :kpi_id
      t.integer :business_id
      t.integer :businesskpi_id

      t.timestamps
    end
  end
end
