# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :email, :last_name, :first_name, :password, :password_confirmation, :length => { :maximum => 50 } 
  validates :first_name, :last_name, :presence => true
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true
  has_secure_password
  has_many :microposts, :dependent => :destroy
  validates_confirmation_of :password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }
  def feed
    Micropost.where("user_id = ?", id)
  end

  private
	def create_remember_token
	  self.remember_token = SecureRandom.base64.tr("+/", "-_")
	end
end
