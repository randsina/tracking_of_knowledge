class Theme < ActiveRecord::Base
  belongs_to :technology
  validates :name, presence: true, uniqueness: true
end
