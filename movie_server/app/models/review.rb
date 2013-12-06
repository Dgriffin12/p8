require 'open-uri'
require 'nokogiri'

class Review < ActiveRecord::Base
  belongs_to :user
  has_many :comments
def self.search(search)
	if(search)
		find(:all, :conditions => ['movie LIKE ?', "%#{search}%"])
	else
		nil
	end
end

end
