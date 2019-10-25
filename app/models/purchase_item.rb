class PurchaseItem < ApplicationRecord
  belongs_to :app
  belongs_to :user
  def use
    self.used_times = self.used_times + 1
    self.save
  end
end
