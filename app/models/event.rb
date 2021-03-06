class Event < ActiveRecord::Base
  belongs_to :organizers, class_name: "User"
  has_many :taggings
  has_many :tags, through: :taggings
  attr_accessor :all_tags
  extend FriendlyId
  friendly_id :title, use: :slugged
  def slug_candidates
    [
      :title,
      [:title,:location]
    ]
  end
  def all_tags
    tags.map(&:name).join(",")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end

  def self.tag_counts
    Tag.select("tags.name,count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

end
