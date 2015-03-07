class User < ActiveRecord::Base
  belongs_to :role
  before_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.provider = auth.provider
      user.uid = auth.uid
      user.skip_confirmation!
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  private

  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end
