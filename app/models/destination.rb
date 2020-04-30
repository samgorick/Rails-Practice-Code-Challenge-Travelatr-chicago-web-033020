class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def recent_five
    posts.order("created_at DESC").limit(5)
  end

  def most_likes
    self.posts.max do |a, b|
      a.likes <=> b.likes
    end
  end

  def average_age
    total = 0
    bloggers.uniq.each { |blogger| total += blogger.age }
    total / bloggers.uniq.count
  end

end
