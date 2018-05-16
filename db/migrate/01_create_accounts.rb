class CreateAccounts < ActiveRecord::Migration[5.0]

  def change
    create_table :accounts do |t|
      t.string :number
      t.integer :balance
    end
  end
end