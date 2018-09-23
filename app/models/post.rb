require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

  def clickbait
    if title && !title.match(/(Won't Believe)|(Secret)|(Top [0-9]+)|(Guess)/)
      errors.add(:title, "is not clickbaity enough")
    end
  end
end
