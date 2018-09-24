class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?, on: :create

  # def clickbait?
  #   binding.pry
  #   errors.add(:title, "is not clickbaity enough!") unless ["Won't Believe", "Secret", "Top","Guess"].any?{|e| e.in?(self.title)}
  # end

  def clickbait?
    if self.title && !(["Won't Believe", "Secret", "Top","Guess"].any?{|e| self.title.include?(e)})
      errors.add(:title, "is not clickbaity enough!")
    end
  end
end
