class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_has_clickbait

  def title_has_clickbait
    array = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    if title && array.none? { |word| title.include?(word) }
      errors.add(:title, "needs moar clickbait")
    end
  end
end
