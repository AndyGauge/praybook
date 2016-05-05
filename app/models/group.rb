class Group < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :people, through: :memberships
end
