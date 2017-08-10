class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :business_id
      t.string :phone
      t.string :location
      t.string :name

      t.timestamps
    end
  end
end
