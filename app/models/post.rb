class Post < ActiveRecord::Base
  belongs_to :person
  scope :prayers, -> {where(type: 'Prayer')}
end
