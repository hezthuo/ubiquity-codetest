class AddUserIdToCsvs < ActiveRecord::Migration[7.0]
  def change
    add_column :csvs, :user_id, :integer
  end
end
