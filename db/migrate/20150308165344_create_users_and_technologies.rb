class CreateUsersAndTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies_users do |t|
      t.belongs_to :technology, index: true
      t.belongs_to :user, index: true
    end
  end
end
