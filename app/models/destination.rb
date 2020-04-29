class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    self.posts.sort_by { |p| p.created_at }.last(5).reverse
  end

  def featured_post
    self.posts.max_by { |p| p.likes }
  end

  def average_age
    ages = self.bloggers.uniq.map { |b| b.age }
    ages.reduce(:+).to_f / ages.length
  end
end
