class AddUserToYelp < ActiveRecord::Migration[5.1]
  def change
    add_reference :yelps, :user, foreign_key: true
  end
end
