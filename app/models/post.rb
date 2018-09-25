class Post < ActiveRecord::Base
 validates :title, presence: true
 validates :content, length: {minimum: 250}
 validates :summary, length: {maximum: 250}
 validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
 validate :is_clickbait?

 CLICKBAIT = [/Won’t Believe/,/Secret/,/Top [0-9]*/,/Guess/]

 def is_clickbait?
   if CLICKBAIT.none? do |pattern|
     pattern.match title
   end
     errors.add(:title, “must be clickbait”)
   end
 end

end

 # If the title does not contain
 # "Won't Believe", "Secret", "Top [number]", or
 # "Guess", the validator should return false.
