class AddUuidToPurchases < ActiveRecord::Migration[7.2]
  def change
    add_column :purchases, :uuid, :string
  end
end
