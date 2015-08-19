class CreateFranchisemasters < ActiveRecord::Migration
  def change
    create_table :franchisemasters do |t|
      t.string :franchiseename
      t.string :franchisename
      t.string :franchisetype
      t.string :emailid
      t.date :openingdate
      t.date :effectivefrom
      t.string :business_id
      t.string :address

      t.timestamps
    end
  end
end
