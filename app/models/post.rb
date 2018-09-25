require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 11}
  validates :summary, length: {maximum: 10}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait?

  def click_bait?
    status = false
    check_word = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if self.title
    check_word.each do |w|
       if self.title.include?(w) == true
         status = true
         break
       end
    end
  end
    status
  end

end
