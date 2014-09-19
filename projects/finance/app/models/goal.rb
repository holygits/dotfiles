class Goal < ActiveRecord::Base

	validates :name, uniqueness: true

end
