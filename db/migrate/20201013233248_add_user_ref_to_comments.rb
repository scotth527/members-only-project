class AddUserRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :reference
  end
end
