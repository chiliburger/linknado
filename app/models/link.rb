class Link < ActiveRecord::Base
  validates_presence_of :name, :uri, :username
  validates_numericality_of :points, :only_integer => true, :greater_than_or_equal_to => 0

  default_scope { order('points Desc') }
end
