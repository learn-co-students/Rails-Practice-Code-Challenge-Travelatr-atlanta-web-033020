class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    self.posts.each.map { |p| p.likes }.reduce(:+)
  end

  def featured_post
    self.posts.max_by { |p| p.likes }
  end

  def most_written_destinations
    self.destinations.sort_by { |d| d.posts.length }.uniq.last(5).reverse
  end
end
