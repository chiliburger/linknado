class Link < ActiveRecord::Base
  validates_presence_of :name, :uri, :screen_name
  validates_numericality_of :points, :only_integer => true, :greater_than_or_equal_to => 0
end
