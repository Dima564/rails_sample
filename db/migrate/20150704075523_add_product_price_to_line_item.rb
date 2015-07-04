class AddProductPriceToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :total_price, :decimal, precision: 9, scale: 2, default: 0
    LineItem.reset_column_information
    LineItem.all.each do |line_item|
      line_item.total_price = line_item.product.price * line_item.quantity
      line_item.save
    end
  end

  def self.down
    remove_column :line_items, :total_price
 end
end
