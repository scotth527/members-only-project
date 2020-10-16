class RemoveFieldFromComments < ActiveRecord::Migration[6.0]
  def change
      remove_column :comments, :post_id_id
      remove_column :comments, :post_id
  end
end
