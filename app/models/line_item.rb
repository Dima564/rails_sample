class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :cart

  def decrement
    if self.quantity > 1
      self.quantity -= 1
    else
      self.destroy
    end
    self
  end

end
