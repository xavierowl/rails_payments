class AddProductInfoField < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :info, :string
  end
end
