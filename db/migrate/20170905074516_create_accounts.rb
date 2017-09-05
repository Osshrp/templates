class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.float :balance
      t.string :currency
      t.string :name

      t.timestamps
    end
  end
end
