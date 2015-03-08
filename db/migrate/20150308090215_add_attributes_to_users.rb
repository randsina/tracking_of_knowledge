class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :nickname, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :text
  end
end
