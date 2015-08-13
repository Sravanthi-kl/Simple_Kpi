class CreateKpis < ActiveRecord::Migration
  def change
    create_table :kpis do |t|
      t.string :KPIName
      t.string :KPIEntryPeriod
      t.string :KPICategory
      t.string :KPIDirection
      t.string :KPIUnitName
      t.integer :KPITargetValue
      t.boolean :active

      t.timestamps
    end
  end
end
