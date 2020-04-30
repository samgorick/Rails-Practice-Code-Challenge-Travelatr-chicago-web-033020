class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates_presence_of :name, :age, :bio
  validates_uniqueness_of :name
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    total = 0
    self.posts.each do |post|
      total += post.likes
    end
    total
  end

  def most_likes
    self.posts.max do |a, b|
      a.likes <=> b.likes
    end
  end

end
