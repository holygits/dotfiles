class Expense < ActiveRecord::Base
  after_intialize :init
  belongs_to :portfolio

	validates :name, uniqueness: true

  def init
    self.portfolio_id = 1
  end
end
