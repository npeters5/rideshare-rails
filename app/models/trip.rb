class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def cost_in_dollar
    sprintf('%.2f', (self.cost / 100))
  end

  def pretty_date
    Date.parse(self.date)
  end
end
