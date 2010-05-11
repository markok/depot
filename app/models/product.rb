class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price
  
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
                      :with => %r{\.(gif|jpg|png)}i,
                      :message => "Must end with jpg, gif or png"
  
  
  protected 
    def price_must_be_at_least_a_cent
      if price == nil  || price < 0.01
          errors.add(:price, "Should be at least 0.01")
      end
    end
end
