class AddAmountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :amount, :decimal
  end
end
