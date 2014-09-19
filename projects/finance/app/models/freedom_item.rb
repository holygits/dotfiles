class FreedomItem < ActiveRecord::Base
	after_intialize :init

  belongs_to :portfolio

	validates :name, uniqueness: true
  
  def init
    self.portolio_id = 1
  end

end
