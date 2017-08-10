class CreateYelps < ActiveRecord::Migration[5.1]
  def change
    create_table :yelps do |t|
      t.string :name
      t.string :phone
      t.decimal :rating
      t.string :image
      t.string :price
      t.string :business_id
      t.string :address
      t.integer :review_count

      t.timestamps
    end
  end
end
