class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def cost_in_dollar
    self.cost / 100
  end
end
