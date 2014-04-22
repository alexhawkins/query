class Topic < ActiveRecord::Base
  has_many :questions

  #sort alphabetically
  scope :alphabetically, -> { order('title ASC') }
end
