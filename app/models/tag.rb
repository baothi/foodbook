class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :events, through: :taggings
  def all_tags=(names)
    self.tags = names.split(",").map do |t|
      Tag.where(name: t.strip).first_or_create!
    end
  end
end
