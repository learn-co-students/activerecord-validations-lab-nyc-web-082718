class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

#   def clickbait?
#     if self.title == nil
#         false
#     else
#       unless self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess")
#         errors.add(:title, "Do you WANT Troy to get his axe?")
#       end
#     end
#     end
#
# end


  def clickbait?
    array = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    if title && array.none? { |word| title.include?(word) }
      errors.add(:title, "Do you WANT Troy to get his axe?")
      end
    end
  end
