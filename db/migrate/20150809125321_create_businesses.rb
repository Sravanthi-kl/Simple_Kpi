class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :branchname
      t.string :branchtype
      t.string :branchaddress
      t.string :contactnumbers
      t.string :owner_id
      t.string :facebook_id
      t.string :twitter_id
      t.string :emailid
      t.string :shortname
      t.string :city
      t.string :maplink
      t.string :workinghours

      t.timestamps
    end
  end
end
