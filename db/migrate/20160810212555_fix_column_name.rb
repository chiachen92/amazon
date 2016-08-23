class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :name, :title
    add_column :products, :description, :string
  end


end
