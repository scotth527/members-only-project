class AddUserRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user, foreign_key:true
  end
end
