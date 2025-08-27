class AddDetailsColumnToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :details, :string
  end
end
