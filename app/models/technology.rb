class Technology < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :themes, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
