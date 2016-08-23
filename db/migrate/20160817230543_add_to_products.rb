class AddToProducts < ActiveRecord::Migration[5.0]
  def change
      add_reference :products, :category
      add_foreign_key :products, :categories
  end
end
