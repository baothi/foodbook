class Recipe < ActiveRecord::Base
  belongs_to :food_type
  DIFFICULTY=%w(Easy Medium Hard)
end
