# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before do
   @user = User.new(:first_name => "Example", :last_name => "eg", :email => "user@example.com", :password_digest => "foobar", :password => "foobar", :password_confirmation => "foobar") 
  end 
  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }


describe "when password doesn't match confirmation" do
  before { @user.password_confirmation = "mismatch" }
  it { should_not be_valid }
end
 
 describe "when name is not present" do
  before { @user.first_name = " " }
  before { @user.last_name = " " }
  it { should_not be_valid }
 end
 
 describe "when email is not present" do
  before {@user.email = " " }
  it { should_not be_valid }
 end

 describe "when name is too long" do
  before { @user.first_name = "a" * 51 }
  before { @user.last_name = "a" * 51 }
 end
 
 describe "when email format is invalid" do
  it "should be invalid" do
   addresses = %w[user@foo,com user_at_foo.com example.user@foo. foo@bar_baz.com foo@bar_baz.com]
   addresses.each do |invalid_address|
	@user.email = invalid_address
	@user.should_not be_valid
   end
  end
 end
describe "when password is not present" do
  before { @user.password = @user.password_confirmation = " " }
  it { should_not be_valid }
end
 describe "when email format is valid" do
  it "should be valid" do
   addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
  end
 end
end
