class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Non-Fiction", "Fiction"] }
  validate :clickbait

  def clickbait
    if title && !title.match(/(Won't Believe)|(Secret)|(Top)|(Guess)/)
      errors.add(:title)
    end
  end

end
