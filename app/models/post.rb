class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction NonFiction),
    message: "%{value} is not a valid category" }
  validate :click_bait


    PHRASES = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]


  def click_bait
    if PHRASES.none? { |phrase| phrase.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
