class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :account
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
