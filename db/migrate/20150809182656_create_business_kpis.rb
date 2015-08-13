class CreateBusinessKpis < ActiveRecord::Migration
  def change
    create_table :business_kpis do |t|
      t.integer :business_id
      t.integer :kpi_id

      t.timestamps
    end
  end
end
