class AddTechnologyRefToThemes < ActiveRecord::Migration
  def change
    add_reference :themes, :technology, index: true
    add_foreign_key :themes, :technologies
  end
end
