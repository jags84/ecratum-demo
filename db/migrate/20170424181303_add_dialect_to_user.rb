class AddDialectToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dialect, :string
  end
end
