class Login < ActiveRecord::Base
  # I am using Login model to hack in features to form helpers.
  attr_accessor :email, :password
end