class User < ActiveRecord::Base
  belongs_to :role
  before_create :set_default_role
  has_and_belongs_to_many :technologies
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name   # assuming the user model has a name
      user.surname = auth.info.last_name
      user.nickname = auth.info.nickname
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
