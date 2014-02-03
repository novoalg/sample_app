# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :last_name, :first_name, :password_digest, :password, :password_confirmation, :length => { :maximum => 50 } 
  validates :first_name, :last_name, :presence => true
  validates :password, :presence => true, :length => { :minimum => 6 }
  has_secure_password
  validates_confirmation_of :password
  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }
end
